import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

/// Bottom sheet to attach an image from the camera or gallery.
/// Returns the picked [XFile], or null if cancelled.
class AttachSheet {
  static Future<XFile?> show(BuildContext context) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => const _AttachOptions(),
    );
    if (source == null) return null;
    return ImagePicker().pickImage(source: source, imageQuality: 80, maxWidth: 1920);
  }
}

class _AttachOptions extends StatelessWidget {
  const _AttachOptions();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _option(context, Icons.photo_camera_outlined, l10n.camera, ImageSource.camera),
            _option(context, Icons.photo_library_outlined, l10n.gallery, ImageSource.gallery),
          ],
        ),
      ),
    );
  }

  Widget _option(BuildContext context, IconData icon, String label, ImageSource source) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textPrimary, size: 24.sp),
      title: Text(label, style: AppTextStyles.style16px.w700),
      trailing: Icon(Icons.chevron_right, color: AppColors.textSecondary, size: 20.sp),
      onTap: () => Navigator.of(context).pop(source),
    );
  }
}
