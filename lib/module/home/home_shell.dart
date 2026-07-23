import 'package:connect/module/auth/application/session_controller.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Temporary landing screen after login. Confirms the session works;
/// the real retailer/customer home comes in the next modules.
class HomeShell extends ConsumerWidget {
  const HomeShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(sessionControllerProvider).value;

    return Scaffold(
      appBar: CommonAppBar(
        title: 'Mitra',
        showBack: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: AppColors.icon),
            onPressed: () => ref.read(sessionControllerProvider.notifier).logout(),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('You are signed in 🎉', style: AppTextStyles.style22px.w700),
            SizedBox(height: 16.h),
            _row('User ID', user?.id ?? '-'),
            _row('Name', user?.name ?? '—'),
            _row('Phone', user?.phone ?? '—'),
            _row('Retailer', (user?.isRetailer ?? false) ? 'Yes' : 'No'),
            _row('Following', '${user?.linkedShops.length ?? 0} shop(s)'),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 110,
              child: Text(label,
                  style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary)),
            ),
            Expanded(child: Text(value, style: AppTextStyles.style14px.w600)),
          ],
        ),
      );
}
