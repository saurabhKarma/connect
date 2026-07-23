import 'dart:io';

import 'package:connect/module/broadcast/data/broadcast_message.dart';
import 'package:connect/module/broadcast/data/broadcast_summary.dart';
import 'package:connect/module/broadcast/presentation/widgets/attach_sheet.dart';
import 'package:connect/module/broadcast/presentation/widgets/message_bubble.dart';
import 'package:connect/module/broadcast/presentation/widgets/start_broadcast_sheet.dart';
import 'package:connect/module/contact/presentation/contacts_screen.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

/// A broadcast thread: message bubbles + composer (attach image + send).
class BroadcastDetailScreen extends ConsumerStatefulWidget {
  final BroadcastSummary broadcast;

  const BroadcastDetailScreen({super.key, required this.broadcast});

  @override
  ConsumerState<BroadcastDetailScreen> createState() => _BroadcastDetailScreenState();
}

class _BroadcastDetailScreenState extends ConsumerState<BroadcastDetailScreen> {
  final _msgController = TextEditingController();
  late String _name = widget.broadcast.name;
  XFile? _pendingImage;
  late final List<BroadcastMessage> _messages = [
    BroadcastMessage(text: widget.broadcast.preview, time: widget.broadcast.time),
  ];

  @override
  void dispose() {
    _msgController.dispose();
    super.dispose();
  }

  Future<void> _attach() async {
    final file = await AttachSheet.show(context);
    if (file != null && mounted) setState(() => _pendingImage = file);
  }

  void _send() {
    final text = _msgController.text.trim();
    if (text.isEmpty && _pendingImage == null) return;
    setState(() {
      _messages.add(BroadcastMessage(
        text: text.isEmpty ? null : text,
        imagePath: _pendingImage?.path,
        time: DateFormat('h:mm a').format(DateTime.now()),
      ));
      _msgController.clear();
      _pendingImage = null;
    });
    // TODO: upload image (POST /media) + create the broadcast (POST /broadcasts).
  }

  Future<void> _onMenu(String value) async {
    switch (value) {
      case 'delete':
        Navigator.of(context).maybePop(); // TODO: DELETE broadcast
        break;
      case 'edit':
        final name = await StartBroadcastSheet.show(context);
        if (name != null && mounted) setState(() => _name = name);
        break;
      case 'add':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const ContactsScreen(asFlow: true)),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffold,
        surfaceTintColor: AppColors.scaffold,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            UserAvatar(name: _name, size: 34),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(_name,
                  maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.style18px.w700),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: AppColors.textPrimary),
            color: AppColors.card,
            onSelected: _onMenu,
            itemBuilder: (_) => [
              PopupMenuItem(value: 'delete', child: Text(l10n.delete, style: AppTextStyles.style14px.w600)),
              PopupMenuItem(value: 'edit', child: Text(l10n.editName, style: AppTextStyles.style14px.w600)),
              PopupMenuItem(value: 'add', child: Text(l10n.addMember, style: AppTextStyles.style14px.w600)),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: _messages.length,
                itemBuilder: (_, i) => MessageBubble(message: _messages[i]),
              ),
            ),
            if (_pendingImage != null) _pendingPreview(),
            _composer(l10n),
          ],
        ),
      ),
    );
  }

  Widget _pendingPreview() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 8.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.file(File(_pendingImage!.path), width: 80.w, height: 80.w, fit: BoxFit.cover),
            ),
            Positioned(
              right: 2,
              top: 2,
              child: GestureDetector(
                onTap: () => setState(() => _pendingImage = null),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                  padding: const EdgeInsets.all(2),
                  child: const Icon(Icons.close, size: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _composer(l10n) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 10.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: AppColors.border),
        ),
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.attach_file, color: AppColors.textSecondary, size: 22.sp),
              onPressed: _attach,
            ),
            Expanded(
              child: TextField(
                controller: _msgController,
                style: AppTextStyles.style14px.w500,
                minLines: 1,
                maxLines: 4,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: l10n.sendMessage,
                  hintStyle: AppTextStyles.style14px.w400.copyWith(color: AppColors.textHint),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: AppColors.primary, size: 22.sp),
              onPressed: _send,
            ),
          ],
        ),
      ),
    );
  }
}
