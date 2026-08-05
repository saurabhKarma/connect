import 'package:connect/module/broadcast/application/broadcast_providers.dart';
import 'package:connect/module/broadcast/data/broadcast_api_models.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A broadcast's message + per-recipient delivery status.
class BroadcastDeliveryScreen extends ConsumerWidget {
  final String broadcastId;

  const BroadcastDeliveryScreen({super.key, required this.broadcastId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(broadcastDetailProvider(broadcastId));
    return Scaffold(
      appBar: const CommonAppBar(title: 'Broadcast', showBack: true),
      body: SafeArea(
        top: false,
        child: async.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(
            child: Text('Could not load broadcast',
                style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
          ),
          data: (detail) => _content(detail),
        ),
      ),
    );
  }

  Widget _content(BroadcastDetail detail) {
    final b = detail.broadcast;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      children: [
        if (b.message != null && b.message!.isNotEmpty)
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12.r)),
            child: Text(b.message!, style: AppTextStyles.style14px.w500.copyWith(color: AppColors.onPrimary)),
          ),
        SizedBox(height: 16.h),
        Text('Recipients (${detail.recipients.length})', style: AppTextStyles.style14px.w700),
        SizedBox(height: 8.h),
        ...detail.recipients.map(_recipientRow),
      ],
    );
  }

  Widget _recipientRow(RecipientDelivery r) {
    final name = (r.name != null && r.name!.isNotEmpty) ? r.name! : r.phone;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          UserAvatar(name: name, size: 40),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.style14px.w600),
                Text(r.phone, style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
          _statusChip(r.status),
        ],
      ),
    );
  }

  Widget _statusChip(String status) {
    Color color;
    String label;
    switch (status) {
      case 'READ':
        color = AppColors.primary;
        label = 'Read';
        break;
      case 'SENT':
        color = AppColors.textSecondary;
        label = 'Delivered';
        break;
      case 'SUPPRESSED':
        color = AppColors.textHint;
        label = 'Muted';
        break;
      case 'NO_DEVICE':
        color = AppColors.textHint;
        label = 'Not on app';
        break;
      default:
        color = Colors.redAccent;
        label = 'Failed';
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(label, style: AppTextStyles.style11px.w700.copyWith(color: color)),
    );
  }
}
