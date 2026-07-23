import 'package:connect/module/auth/application/session_controller.dart';
import 'package:connect/module/auth/presentation/app_lock_gate.dart';
import 'package:connect/module/auth/presentation/phone_screen.dart';
import 'package:connect/module/main/main_shell.dart';
import 'package:connect/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionControllerProvider);

    return session.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator(color: AppColors.primary)),
      ),
      error: (_, __) => const PhoneScreen(),
      data: (user) =>
          user == null ? const PhoneScreen() : const AppLockGate(child: MainShell()),
    );
  }
}
