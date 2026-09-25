import 'package:connect/module/chat/application/chat_providers.dart';
import 'package:connect/module/chat/presentation/chat_thread_screen.dart';
import 'package:connect/module/chat/presentation/widgets/conversation_tile.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Pick an existing conversation to forward a product into.
class ProductSharePicker extends ConsumerWidget {
  final String productId;

  const ProductSharePicker({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final chats = ref.watch(chatListProvider);

    return Scaffold(
      appBar: CommonAppBar(title: l10n.shareToChat),
      body: SafeArea(
        child: chats.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => Center(
            child: Text(l10n.couldNotLoadChats,
                style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
          ),
          data: (list) {
            if (list.isEmpty) {
              return Center(
                child: Text(l10n.noConnectionsYet,
                    style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary)),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              itemCount: list.length,
              itemBuilder: (_, i) {
                final c = list[i];
                return ConversationTile(
                  conversation: c,
                  onTap: () => _send(context, ref, c.id, c.peerUserId,
                      c.peerName ?? c.peerPhone ?? 'Chat', c.peerAvatarUrl),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> _send(BuildContext context, WidgetRef ref, String conversationId, String peerUserId,
      String peerName, String? peerAvatarUrl) async {
    try {
      await ref.read(chatRepositoryProvider).sendMessage(conversationId, productId: productId);
      ref.invalidate(chatListProvider);
      if (!context.mounted) return;
      // Replace the picker with the thread so the user sees the shared card.
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => ChatThreadScreen(
          conversationId: conversationId,
          peerUserId: peerUserId,
          peerName: peerName,
          peerAvatarUrl: peerAvatarUrl,
        ),
      ));
    } catch (_) {
      if (context.mounted) ScaffoldToast.showErrorBottom(context, context.l10n.somethingWentWrong);
    }
  }
}
