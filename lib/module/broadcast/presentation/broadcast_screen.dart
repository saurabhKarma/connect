import 'package:connect/module/broadcast/data/broadcast_summary.dart';
import 'package:connect/module/broadcast/presentation/broadcast_detail_screen.dart';
import 'package:connect/module/broadcast/presentation/widgets/broadcast_list_item.dart';
import 'package:connect/module/contact/presentation/contacts_screen.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/app_button.dart';
import 'package:connect/widgets/app_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BroadcastScreen extends ConsumerStatefulWidget {
  const BroadcastScreen({super.key});

  @override
  ConsumerState<BroadcastScreen> createState() => _BroadcastScreenState();
}

class _BroadcastScreenState extends ConsumerState<BroadcastScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final all = ref.watch(broadcastListProvider);
    final broadcasts = _query.isEmpty
        ? all
        : all.where((b) => b.name.toLowerCase().contains(_query.toLowerCase())).toList();

    return Scaffold(
      appBar: CommonAppBar(title: l10n.broadcast, showBack: false),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 8.h),
              child: AppSearchField(
                hintText: l10n.searchByNameNumber,
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
            Expanded(
              child: all.isEmpty
                  ? _emptyState(l10n)
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                      itemCount: broadcasts.length,
                      itemBuilder: (_, i) => BroadcastListItem(
                        broadcast: broadcasts[i],
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => BroadcastDetailScreen(broadcast: broadcasts[i]),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emptyState(l10n) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.podcasts, size: 96.sp, color: AppColors.border),
          SizedBox(height: 16.h),
          Text(l10n.noBroadcastYet,
              style: AppTextStyles.style16px.w700.copyWith(color: AppColors.textSecondary)),
          SizedBox(height: 16.h),
          SizedBox(
            width: 200.w,
            child: AppButton(label: l10n.startBroadcast, onPressed: _startBroadcast),
          ),
        ],
      ),
    );
  }

  void _startBroadcast() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ContactsScreen(asFlow: true)),
    );
  }
}
