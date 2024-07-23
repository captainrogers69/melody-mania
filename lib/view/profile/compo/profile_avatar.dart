import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/cache_image.dart';

class ProfileAvatar extends StatelessWidget {
  final double? heightWidth;
  final String avatarUrl;
  const ProfileAvatar({this.heightWidth, required this.avatarUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightWidth ?? 25.sp,
      width: heightWidth ?? 25.sp,
      child: CacheImage(
        image: avatarUrl,
        height: heightWidth ?? 25.sp,
        width: heightWidth ?? 25.sp,
      ),
    );
  }
}
