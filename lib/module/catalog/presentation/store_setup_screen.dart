import 'dart:io';

import 'package:connect/l10n/app_localizations.dart';
import 'package:connect/module/broadcast/presentation/widgets/attach_sheet.dart';
import 'package:connect/module/catalog/application/catalog_providers.dart';
import 'package:connect/module/catalog/data/catalog_models.dart';
import 'package:connect/module/catalog/presentation/catalog_categories.dart';
import 'package:connect/module/media/media_repository.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/app_button.dart';
import 'package:connect/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

/// Create or edit the caller's store. A short form: logo (optional), name, category, tagline.
class StoreSetupScreen extends ConsumerStatefulWidget {
  final CatalogStore? existing;

  const StoreSetupScreen({super.key, this.existing});

  @override
  ConsumerState<StoreSetupScreen> createState() => _StoreSetupScreenState();
}

class _StoreSetupScreenState extends ConsumerState<StoreSetupScreen> {
  final _media = MediaRepository();
  late final TextEditingController _name;
  late final TextEditingController _tagline;
  String? _category;
  String? _logoUrl;
  XFile? _pendingLogo;
  bool _saving = false;

  bool get _isEdit => widget.existing != null;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.existing?.name ?? '');
    _tagline = TextEditingController(text: widget.existing?.tagline ?? '');
    _category = widget.existing?.category;
    _logoUrl = widget.existing?.logoUrl;
  }

  @override
  void dispose() {
    _name.dispose();
    _tagline.dispose();
    super.dispose();
  }

  Future<void> _pickLogo() async {
    final file = await AttachSheet.show(context);
    if (file != null && mounted) setState(() => _pendingLogo = file);
  }

  bool get _valid => _name.text.trim().isNotEmpty && _category != null;

  Future<void> _save() async {
    if (!_valid || _saving) return;
    setState(() => _saving = true);
    try {
      String? logoUrl = _logoUrl;
      if (_pendingLogo != null) logoUrl = await _media.uploadImage(_pendingLogo!.path);
      final repo = ref.read(catalogRepositoryProvider);
      if (_isEdit) {
        await repo.updateStore(
          name: _name.text.trim(),
          category: _category,
          tagline: _tagline.text.trim(),
          logoUrl: logoUrl,
        );
      } else {
        await repo.createStore(
          name: _name.text.trim(),
          category: _category!,
          tagline: _tagline.text.trim().isEmpty ? null : _tagline.text.trim(),
          logoUrl: logoUrl,
        );
      }
      ref.invalidate(myStoreProvider);
      if (mounted) Navigator.of(context).pop(true);
    } catch (_) {
      if (mounted) ScaffoldToast.showErrorBottom(context, context.l10n.couldNotSaveStore);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CommonAppBar(title: _isEdit ? l10n.editStore : l10n.setUpYourStore),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 20.h),
                children: [
                  Center(child: _logoPicker(l10n)),
                  SizedBox(height: 24.h),
                  _label(l10n.storeName),
                  AppTextField(
                    controller: _name,
                    hintText: l10n.storeNameHint,
                    maxLength: 120,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => setState(() {}),
                  ),
                  SizedBox(height: 18.h),
                  _label(l10n.category),
                  _categoryChips(l10n),
                  SizedBox(height: 18.h),
                  _label(l10n.storeTagline),
                  AppTextField(
                    controller: _tagline,
                    hintText: l10n.taglineHint,
                    maxLength: 200,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 12.h),
              child: AppButton(
                label: _isEdit ? l10n.saveChanges : l10n.createStore,
                isLoading: _saving,
                enabled: _valid,
                onPressed: _save,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Text(text, style: AppTextStyles.style13px.w600.copyWith(color: AppColors.textSecondary)),
      );

  Widget _logoPicker(l10n) {
    final size = 96.w;
    Widget inner;
    if (_pendingLogo != null) {
      inner = Image.file(File(_pendingLogo!.path), width: size, height: size, fit: BoxFit.cover);
    } else if (_logoUrl != null && _logoUrl!.isNotEmpty) {
      inner = Image.network(_logoUrl!, width: size, height: size, fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _logoPlaceholder(size));
    } else {
      inner = _logoPlaceholder(size);
    }
    return GestureDetector(
      onTap: _pickLogo,
      child: Column(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(20.r), child: inner),
          SizedBox(height: 8.h),
          Text(l10n.storeLogo,
              style: AppTextStyles.style12px.w500.copyWith(color: AppColors.primary)),
        ],
      ),
    );
  }

  Widget _logoPlaceholder(double size) => Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Icon(Icons.storefront, color: AppColors.primary, size: 40.sp),
      );

  Widget _categoryChips(AppLocalizations l10n) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: kCatalogCategories.map((value) {
        final selected = _category == value;
        return GestureDetector(
          onTap: () => setState(() => _category = value),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: selected ? AppColors.primary : AppColors.surface,
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(color: selected ? AppColors.primary : AppColors.border),
            ),
            child: Text(
              localizedCategory(l10n, value),
              style: AppTextStyles.style13px.w600
                  .copyWith(color: selected ? AppColors.onPrimary : AppColors.textPrimary),
            ),
          ),
        );
      }).toList(),
    );
  }
}
