import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/k_colors.dart';

class DiscoverTextfield extends StatelessWidget {
  const DiscoverTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      decoration: BoxDecoration(
        color: KColors.whiteColor,
        borderRadius: BorderRadius.circular(6),
      ),
      height: 32.sp,
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: KColors.blackColor,
            size: 25.sp,
          ),
          SizedBox(width: 10.sp),
          Expanded(
            child: TextField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                isCollapsed: true,
                hintText: 'What do you want to listen to?',
                hintStyle: Theme.of(context).textTheme.titleSmall,
                border: InputBorder.none,
              ),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
