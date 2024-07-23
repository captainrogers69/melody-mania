import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/k_colors.dart';
// nunitoSans, gilroy

class AppTheme {
  AppTheme._();
  static final darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: KColors.blackColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: KColors.blackColor,
      actionsIconTheme: const IconThemeData(color: KColors.whiteColor),
      iconTheme: const IconThemeData(color: KColors.whiteColor),
      titleTextStyle: TextStyle(
        //) Kstyles.kAppBarTextStyle.copyWith(
        // fontFamily: KFonts.OpensansSemibold.name,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.35,
        color: KColors.whiteColor,
        fontSize: 18.sp,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        // fontFamily: KFonts.Opensans.name,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.45,
        color: KColors.blackColor,
        fontSize: 12.5.sp,
      ),
      bodyLarge: TextStyle(
        // fontFamily: KFonts.Opensans.name,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.45,
        color: KColors.blackColor,
        fontSize: 14.sp,
      ),
      bodySmall: TextStyle(
        // fontFamily: KFonts.Opensans.name,
        fontWeight: FontWeight.w500,
        color: KColors.whiteColor,
        letterSpacing: 0.45,
        fontSize: 11.sp,
      ),

      /// for search hint
      labelSmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: KColors.whiteColor,
        // fontFamily: KFonts.Opensans.name,
        letterSpacing: 0.45,
        fontSize: 11.sp,
      ),

      /// button style
      labelLarge: TextStyle(
        // fontFamily: KFonts.Opensans.name,
        fontWeight: FontWeight.w500,
        color: KColors.whiteColor,
        fontSize: 13.sp,
      ),

      /// button style small
      labelMedium: TextStyle(
        // fontFamily: KFonts.Opensans.name,
        fontWeight: FontWeight.w600,
        color: KColors.whiteColor,
        fontSize: 12.sp,
      ),

      /// for appbar
      titleMedium: TextStyle(
        // fontFamily: KFonts.OpensansSemibold.name,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.45,
        color: KColors.whiteColor,
        fontSize: 14.sp,
      ),

      /// for headings
      titleLarge: TextStyle(
        // fontFamily: KFonts.OpensansSemibold.name,
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        color: KColors.blackColor,
      ),
    ),
  );
}
