import 'package:connect/module/settings/application/settings_controller.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/app_images.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/services/lock_service.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Gates its [child] behind biometric/device auth when the App Lock setting is on.
/// Authenticates on launch and re-locks when the app is backgrounded.
class AppLockGate extends ConsumerStatefulWidget {
  final Widget child;

  const AppLockGate({super.key, required this.child});

  @override
  ConsumerState<AppLockGate> createState() => _AppLockGateState();
}

class _AppLockGateState extends ConsumerState<AppLockGate> with WidgetsBindingObserver {
  bool _unlocked = false;
  bool _authInProgress = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _authenticate());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_authInProgress) return; // ignore lifecycle churn from the auth prompt itself
    final locked = ref.read(settingsControllerProvider).appLock;
    if (!locked) return;
    if (state == AppLifecycleState.paused) {
      if (mounted) setState(() => _unlocked = false); // re-lock in background
    } else if (state == AppLifecycleState.resumed && !_unlocked) {
      _authenticate();
    }
  }

  Future<void> _authenticate() async {
    final locked = ref.read(settingsControllerProvider).appLock;
    if (!locked) {
      if (mounted) setState(() => _unlocked = true);
      return;
    }
    if (_unlocked || _authInProgress) return;
    _authInProgress = true;
    final ok = await ref.read(lockServiceProvider).authenticate('Unlock Mitra');
    _authInProgress = false;
    if (mounted) setState(() => _unlocked = ok);
  }

  @override
  Widget build(BuildContext context) {
    final locked = ref.watch(settingsControllerProvider.select((s) => s.appLock));
    if (!locked || _unlocked) return widget.child;
    return _LockScreen(onUnlock: _authenticate);
  }
}

class _LockScreen extends StatelessWidget {
  final VoidCallback onUnlock;

  const _LockScreen({required this.onUnlock});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.mitraLogo, height: 120.h),
              SizedBox(height: 32.h),
              Icon(Icons.lock_outline, size: 48.sp, color: AppColors.primary),
              SizedBox(height: 16.h),
              Text(l10n.appLocked, style: AppTextStyles.style20px.w700),
              SizedBox(height: 8.h),
              Text(l10n.appLockedMessage,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.style14px.w400.copyWith(color: AppColors.textSecondary)),
              SizedBox(height: 32.h),
              SizedBox(
                width: 220.w,
                child: AppButton(
                  label: l10n.unlock,
                  icon: Icons.fingerprint,
                  onPressed: () async => onUnlock(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
