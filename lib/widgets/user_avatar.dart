import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/res/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Circular avatar: shows a network photo (imageUrl) or contact photo (bytes) if available,
/// else initials on a deterministic pastel color.
class UserAvatar extends StatelessWidget {
  final String name;
  final double size;
  final Uint8List? photo;
  final String? imageUrl;

  const UserAvatar({super.key, required this.name, this.size = 48, this.photo, this.imageUrl});

  static const List<Color> _palette = [
    Color(0xFFF2A6A6), // pink
    Color(0xFF9FD8A8), // green
    Color(0xFFA6B4F2), // blue
    Color(0xFFCB9FE6), // purple
    Color(0xFFF2C79F), // orange
    Color(0xFF9FE6DA), // teal
  ];

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts[1].substring(0, 1)).toUpperCase();
  }

  Color get _color => _palette[name.hashCode.abs() % _palette.length];

  Widget _initialsAvatar() {
    return Container(
      width: size.w,
      height: size.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: _color, shape: BoxShape.circle),
      child: Text(_initials, style: AppTextStyles.style16px.w700.copyWith(color: Colors.black87)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (photo != null && photo!.isNotEmpty) {
      return CircleAvatar(radius: size.w / 2, backgroundImage: MemoryImage(photo!));
    }
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          width: size.w,
          height: size.w,
          fit: BoxFit.cover,
          placeholder: (_, __) => _initialsAvatar(),
          errorWidget: (_, __, ___) => _initialsAvatar(),
        ),
      );
    }
    return _initialsAvatar();
  }
}
