import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_button.dart';
import 'package:connect/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartBroadcastSheet extends StatefulWidget {
  const StartBroadcastSheet({super.key});

  static Future<String?> show(BuildContext context) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => const StartBroadcastSheet(),
    );
  }

  @override
  State<StartBroadcastSheet> createState() => _StartBroadcastSheetState();
}

class _StartBroadcastSheetState extends State<StartBroadcastSheet> {
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(l10n.broadcastName, style: AppTextStyles.style18px.w700)),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(Icons.close, color: AppColors.textPrimary, size: 22.sp),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          AppTextField(controller: _name, hintText: l10n.broadcastName),
          SizedBox(height: 16.h),
          AppButton(
            label: l10n.startBroadcast,
            onPressed: () {
              final name = _name.text.trim();
              if (name.isEmpty) return;
              Navigator.of(context).pop(name);
            },
          ),
        ],
      ),
    );
  }
}
