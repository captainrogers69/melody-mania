import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/k_assets.dart';
import '../../../utils/constants/k_colors.dart';

class DiscoverTextfield extends StatelessWidget {
  final void Function() onTap;
  const DiscoverTextfield({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: KColors.transparentColor,
      highlightColor: KColors.transparentColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 10.sp),
        margin: EdgeInsets.symmetric(horizontal: 10.sp),
        decoration: BoxDecoration(
          color: KColors.whiteColor,
          borderRadius: BorderRadius.circular(6),
        ),
        // height: 32.sp,
        child: Row(
          children: [
            Image.asset(
              KAssets.search,
              color: KColors.blackColor,
              scale: 22.sp,
            ),
            SizedBox(width: 10.sp),
            Expanded(
              child: TextField(
                onTap: onTap,
                enabled: false,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  isCollapsed: true,
                  hintText: 'What do you want to listen to?',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w400),
                  border: InputBorder.none,
                ),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
