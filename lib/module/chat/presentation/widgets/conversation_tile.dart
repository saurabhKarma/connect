import 'package:connect/module/chat/data/chat_models.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

/// A chat-list row: peer avatar, name + last-message preview, time + unread badge.
class ConversationTile extends StatelessWidget {
  final Conversation conversation;
  final VoidCallback? onTap;

  const ConversationTile({super.key, required this.conversation, this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = conversation;
    final title = (c.peerName != null && c.peerName!.isNotEmpty) ? c.peerName! : (c.peerPhone ?? 'Unknown');
    final unread = c.unreadCount > 0;
    final preview = c.lastMessagePreview ?? '';

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserAvatar(name: title, imageUrl: c.peerAvatarUrl, size: 52),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.style16px.w700),
                  SizedBox(height: 3.h),
                  Text(
                    preview,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.style13px.w500.copyWith(
                      color: unread ? AppColors.textPrimary : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(_time(c.lastMessageAt),
                    style: AppTextStyles.style12px.w500.copyWith(
                        color: unread ? AppColors.primary : AppColors.textSecondary)),
                SizedBox(height: 6.h),
                if (unread)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
                    decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(20.r)),
                    constraints: BoxConstraints(minWidth: 20.w),
                    child: Text(
                      '${c.unreadCount}',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.style11px.w700.copyWith(color: AppColors.onPrimary),
                    ),
                  )
                else
                  SizedBox(height: 18.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _time(DateTime? dt) {
    if (dt == null) return '';
    final local = dt.toLocal();
    final now = DateTime.now();
    final sameDay = local.year == now.year && local.month == now.month && local.day == now.day;
    return sameDay ? DateFormat('h:mm a').format(local) : DateFormat('dd/MM/yy').format(local);
  }
}
