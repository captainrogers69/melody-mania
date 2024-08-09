import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:songbird/components/sizing_box.dart';

import '../../../utils/constants/k_colors.dart';
import '../../../utils/constants/k_styles.dart';
import '../../../utils/extensions/melody_extension.dart';

class FloatingNavigationBar extends StatelessWidget {
  /// * TO CHANGE THE HEIGHT OF NAVIGATION BAR
  /// * PREFERRED HEIGHT IS BETWEEN [80-100]
  final double barHeight;
  final String accountPicture;

  /// * TO CHANGE THE WIDTH OF NAVIGATION BAR
  final double? barWidth;

  /// * FOR CHANGING NAV ITEMS ICON SIZE
  final double? iconSize;

  /// * For changing nav items icon color
  final Color? activeColor;
  final Color? inactiveColor;

  /// * Background Color or floating navigation bar
  final Color? backgroundColor;

  //
  final TextStyle? textStyle;

  /// * List to tabs to display
  final List<NavBarItems> items;

  final ValueChanged<int> onChanged;

  /// * For Changing indicator color
  /// * ... height
  /// * ... width
  final Color indicatorColor;
  final double indicatorHeight;
  final double indicatorWidth;

  /// ! THIS WILL IDENTITFY WHICH TAB IS CURRENTLY ACTIVE
  /// ! USING THIS TO SHOW AND HIDE TAB INDICATOR
  static ValueNotifier<int> notifyIndex = ValueNotifier<int>(0);

  const FloatingNavigationBar(
      {this.indicatorColor = Colors.black,
      required this.accountPicture,
      this.indicatorHeight = 5.0,
      this.indicatorWidth = 8.0,
      required this.onChanged,
      this.barHeight = 80.0,
      this.barWidth = 400.0,
      this.backgroundColor,
      required this.items,
      this.inactiveColor,
      this.activeColor,
      this.textStyle,
      this.iconSize,
      super.key})
      : assert(
          (items.length < 5),
          "NavBarItems can't contain more than 4 itmes",
        ),
        assert(
          barHeight <= 100,
          "\n******\nHeight should be less than or equal to 100\n******\n",
        ),
        assert(
          indicatorWidth <= 15 || indicatorHeight <= 15,
          "\n******\n Too much height given to tab indicator \n******\n",
        );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: Container(
          height: barHeight,
          // width: barWidth,
          // margin: const EdgeInsets.symmetric(
          //   horizontal: 15.0,
          //   vertical: 5.0,
          // ),
          padding: const EdgeInsets.all(3).copyWith(top: 0),
          decoration: const BoxDecoration(
            color: KColors.transparentColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              items.length,
              (i) => GestureDetector(
                onTap: () => onPressed(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: Column(
                    children: [
                      Container(
                        height: 3,
                        width: 80.sp,
                        // width: 105.sp,
                        decoration: BoxDecoration(
                          color: !items[i].isActive
                              ? backgroundColor
                              : indicatorColor,
                          borderRadius: eventRadiusStan,
                        ),
                      ),
                      Sbh(h: 8.sp),
                      Expanded(
                        child: Column(
                          children: [
                            Image.asset(
                              items[i].icon,
                              height: 25,
                              width: 25,
                              color: items[i].isActive
                                  ? activeColor
                                  : inactiveColor,
                            ),
                            Sbh(h: 2.sp),
                            Text(
                              items[i].title,
                              style: Kstyles.kVerySmallTextStyle.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                // color: KColors.whiteColor,
                                color: !items[i].isActive
                                    ? inactiveColor
                                    : activeColor,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// * FOR CHANGING NAVIGATION BAR  INDEX
  void onPressed(int index) {
    onChanged(index);
    notifyIndex.value = index;
  }
}

class NavBarItems {
  final String icon;
  final String title;
  final bool isActive;

  NavBarItems({
    required this.icon,
    required this.title,
    required this.isActive,
  });
}
/* 
class BottomTabView extends StatelessWidget {
  final NavBarItems item;
  final String? accountPicture;

  const BottomTabView({
    super.key,
    required this.item,
    this.accountPicture,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        item.title == 'Profile'
            ? accountPicture != null
                ? CacheImage(
                    fit: BoxFit.cover,
                    image: accountPicture!,
                    roundCorner: 100,
                    width: 30,
                    height: 30,
                  )
                : Image.asset(
                    item.icon,
                    height: 25,
                    width: 25,
                    color: item.isActive
                        ? KColors.primaryColor
                        : KColors.whiteColor,
                  )
            : Image.asset(
                item.icon,
                height: 25,
                width: 25,
                color:
                    item.isActive ? KColors.primaryColor : KColors.whiteColor,
              ),
        Text(
          item.title,
          style: Kstyles.kVerySmallTextStyle.copyWith(
            fontSize: 9.sp,
            fontWeight: FontWeight.w600,
            color: KColors.whiteColor,
            // fontWeight: items[i].isActive ? FontWeight.w800
            // color: item.isActive ? KColors.primaryColor : KColors.whiteColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
 */