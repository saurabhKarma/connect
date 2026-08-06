import 'dart:io';

import 'package:connect/module/broadcast/data/broadcast_message.dart';
import 'package:connect/module/broadcast/presentation/widgets/attach_sheet.dart';
import 'package:connect/module/broadcast/presentation/widgets/message_bubble.dart';
import 'package:connect/module/broadcastlist/application/broadcast_list_providers.dart';
import 'package:connect/module/broadcastlist/data/broadcast_list_models.dart';
import 'package:connect/module/media/media_repository.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

/// A broadcast list "thread": history of messages sent to the list (all outgoing) + a composer
/// that broadcasts a new message to every member.
class BroadcastListThreadScreen extends ConsumerStatefulWidget {
  final String listId;
  final String name;

  const BroadcastListThreadScreen({super.key, required this.listId, required this.name});

  @override
  ConsumerState<BroadcastListThreadScreen> createState() => _BroadcastListThreadScreenState();
}

class _BroadcastListThreadScreenState extends ConsumerState<BroadcastListThreadScreen> {
  final _msgController = TextEditingController();
  final _media = MediaRepository();
  XFile? _pendingImage;
  bool _sending = false;

  @override
  void dispose() {
    _msgController.dispose();
    super.dispose();
  }

  Future<void> _attach() async {
    final file = await AttachSheet.show(context);
    if (file != null && mounted) setState(() => _pendingImage = file);
  }

  Future<void> _send() async {
    final text = _msgController.text.trim();
    if ((text.isEmpty && _pendingImage == null) || _sending) return;
    setState(() => _sending = true);
    try {
      String? mediaUrl;
      if (_pendingImage != null) mediaUrl = await _media.uploadImage(_pendingImage!.path);
      await ref.read(broadcastListRepositoryProvider).send(
            widget.listId,
            message: text.isEmpty ? null : text,
            mediaUrl: mediaUrl,
            mediaType: mediaUrl != null ? 'IMAGE' : null,
          );
      _msgController.clear();
      if (mounted) setState(() => _pendingImage = null);
      ref.invalidate(broadcastListsProvider);
    } catch (_) {
      if (mounted) ScaffoldToast.showErrorBottom(context, 'Could not send broadcast.');
    } finally {
      // Always reload the thread from the server (the broadcast may have been created even if the
      // response failed to parse), so the history stays correct.
      ref.invalidate(broadcastListMessagesProvider(widget.listId));
      if (mounted) setState(() => _sending = false);
    }
  }

  BroadcastMessage _toBubble(ListMessage m) {
    final time = DateFormat('h:mm a').format(m.createdAt.toLocal());
    final suffix = ' · ${m.recipientCount}';
    return BroadcastMessage(
      text: m.message == null ? null : '${m.message}$suffix',
      imageUrl: m.mediaUrl,
      time: time,
      fromCustomer: false, // outgoing (green, right)
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final async = ref.watch(broadcastListMessagesProvider(widget.listId));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffold,
        surfaceTintColor: AppColors.scaffold,
        elevation: 0,
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.style18px.w700),
            Text('Broadcast list', style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary)),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: async.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(
                  child: Text('Could not load messages',
                      style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
                ),
                data: (messages) {
                  if (messages.isEmpty) {
                    return Center(
                      child: Text('Send your first broadcast',
                          style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary)),
                    );
                  }
                  return ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.all(16.w),
                    itemCount: messages.length,
                    itemBuilder: (_, i) => MessageBubble(message: _toBubble(messages[i])),
                  );
                },
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
        alignment: Alignment.centerRight,
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
              icon: _sending
                  ? SizedBox(width: 18.w, height: 18.w, child: const CircularProgressIndicator(strokeWidth: 2))
                  : Icon(Icons.send, color: AppColors.primary, size: 22.sp),
              onPressed: _sending ? null : _send,
            ),
          ],
        ),
      ),
    );
  }
}
