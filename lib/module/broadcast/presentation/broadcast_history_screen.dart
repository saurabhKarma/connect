import 'package:connect/module/broadcast/application/broadcast_providers.dart';
import 'package:connect/module/broadcast/data/broadcast_api_models.dart';
import 'package:connect/module/broadcast/presentation/broadcast_delivery_screen.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

/// History of broadcasts the user has sent, with delivery counts.
class BroadcastHistoryScreen extends ConsumerWidget {
  const BroadcastHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(sentBroadcastsProvider);
    return Scaffold(
      appBar: const CommonAppBar(title: 'My Broadcasts', showBack: true),
      body: SafeArea(
        top: false,
        child: async.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(
            child: Text('Could not load broadcasts',
                style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
          ),
          data: (items) {
            if (items.isEmpty) {
              return Center(
                child: Text('No broadcasts yet',
                    style: AppTextStyles.style16px.w700.copyWith(color: AppColors.textSecondary)),
              );
            }
            return RefreshIndicator(
              onRefresh: () async => ref.invalidate(sentBroadcastsProvider),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                itemCount: items.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (_, i) => _tile(context, items[i]),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _tile(BuildContext context, BroadcastItem b) {
    final preview = (b.message != null && b.message!.isNotEmpty)
        ? b.message!
        : (b.mediaUrl != null ? '📷 Photo' : '—');
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => BroadcastDeliveryScreen(broadcastId: b.id)),
      ),
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(preview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.style14px.w600),
                ),
                SizedBox(width: 8.w),
                Text(_time(b.createdAt),
                    style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary)),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              'Sent to ${b.recipientCount} · ${b.sentCount} delivered'
              '${b.failedCount > 0 ? ' · ${b.failedCount} failed' : ''}',
              style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  String _time(DateTime dt) => DateFormat('dd MMM, h:mm a').format(dt.toLocal());
}
