import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/module/broadcast/data/broadcast_message.dart';
import 'package:connect/network/end_points.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/widgets/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A message bubble. Sender (broadcast) = solid green on the left with white text;
/// customer reply (if enabled) = light bubble on the right with dark text.
/// Attached images fit inside a 150x150 box (aspect-preserved, WhatsApp-style)
/// and open a full-screen zoom viewer on tap.
class MessageBubble extends StatelessWidget {
  final BroadcastMessage message;

  const MessageBubble({super.key, required this.message});

  static const double _maxImageHeight = 150;

  bool get _reply => message.fromCustomer;
  bool get _hasImage => message.imagePath != null || message.imageUrl != null;
  bool get _hasText => message.text != null && message.text!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final bg = _reply ? AppColors.surface : AppColors.primary;
    final textColor = _reply ? AppColors.textPrimary : AppColors.onPrimary;
    final timeColor =
        _reply ? AppColors.textSecondary : AppColors.onPrimary.withValues(alpha: 0.85);

    return Align(
      // Sender (me) on the right; customer replies on the left.
      alignment: _reply ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: 0.86.sw),
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(14.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // With a caption the image fills the box width (60%) so it lines up
            // with the caption; image-only keeps its natural aspect ratio.
            if (_hasImage) _imageThumb(context, timeColor, fill: _hasText),
            if (_hasText && _hasImage) _captionUnderImage(textColor, timeColor),
            if (_hasText && !_hasImage) _captionInline(textColor, timeColor),
          ],
        ),
      ),
    );
  }

  Widget _imageThumb(BuildContext context, Color timeColor, {bool fill = false}) {
    final provider = _provider();
    // fill = image fills the box (60% wide, cover-cropped) so it lines up with a caption.
    // otherwise = aspect-preserved, capped at 60% width / 150 height.
    final Widget image = fill
        ? SizedBox(
            width: 0.6.sw,
            height: _maxImageHeight.h,
            child: Image(
              image: provider!,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const ColoredBox(color: Colors.black12),
            ),
          )
        : ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 0.6.sw, maxHeight: _maxImageHeight.h),
            child: Image(
              image: provider!,
              errorBuilder: (_, __, ___) => SizedBox(
                width: 0.6.sw,
                height: _maxImageHeight.h,
                child: const ColoredBox(color: Colors.black12),
              ),
            ),
          );
    return GestureDetector(
      onTap: provider == null ? null : () => openImageViewer(context, provider),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Stack(
          children: [
            image,
            if (!_hasText)
              Positioned(
                right: 6.w,
                bottom: 6.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(message.time,
                      style: AppTextStyles.style11px.w500.copyWith(color: Colors.white)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Caption under an image: wraps within the image width so the bubble hugs it.
  Widget _captionUnderImage(Color textColor, Color timeColor) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 0.6.sw),
      child: Padding(
        padding: EdgeInsets.fromLTRB(6.w, 8.h, 6.w, 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message.text!, style: AppTextStyles.style14px.w500.copyWith(color: textColor)),
            SizedBox(height: 2.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(message.time,
                  style: AppTextStyles.style11px.w500.copyWith(color: timeColor)),
            ),
          ],
        ),
      ),
    );
  }

  // Text-only bubble: caption and time inline.
  Widget _captionInline(Color textColor, Color timeColor) {
    return Padding(
      padding: EdgeInsets.fromLTRB(6.w, 6.h, 8.w, 4.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Text(message.text!,
                style: AppTextStyles.style14px.w500.copyWith(color: textColor)),
          ),
          SizedBox(width: 8.w),
          Text(message.time, style: AppTextStyles.style11px.w500.copyWith(color: timeColor)),
        ],
      ),
    );
  }

  ImageProvider? _provider() {
    if (message.imagePath != null) return FileImage(File(message.imagePath!));
    if (message.imageUrl != null) return CachedNetworkImageProvider(EndPoints.mediaUrl(message.imageUrl!));
    return null;
  }
}
