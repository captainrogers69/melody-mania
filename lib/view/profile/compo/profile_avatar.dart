import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/cache_image.dart';

class ProfileAvatar extends StatelessWidget {
  final String avatarUrl;
  const ProfileAvatar({required this.avatarUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.sp,
      width: 25.sp,
      child: CacheImage(
        image: avatarUrl,
        height: 25.sp,
        width: 25.sp,
      ),
    );
  }
}
