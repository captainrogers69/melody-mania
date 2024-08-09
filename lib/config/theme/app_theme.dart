import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/k_colors.dart';
// nunitoSans, gilroy

class AppTheme {
  AppTheme._();
  static final darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: KColors.blackColor,
    // brightness: Brightness.dark,
    canvasColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: KColors.blackColor,
      actionsIconTheme: const IconThemeData(color: KColors.whiteColor),
      iconTheme: const IconThemeData(color: KColors.whiteColor),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        letterSpacing: 0.35,
        color: KColors.whiteColor,
        fontSize: 18.sp,
      ),
    ),
    listTileTheme: ListTileThemeData(
      leadingAndTrailingTextStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        color: KColors.whiteColor,
      ),
      subtitleTextStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w500,
        color: KColors.grey600,
      ),
      titleTextStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w600,
        color: KColors.whiteColor,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        letterSpacing: 0.45,
        color: KColors.blackColor,
        fontSize: 12.5.sp,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500,
        letterSpacing: 0.45,
        color: KColors.blackColor,
        fontSize: 14.sp,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: KColors.whiteColor,
        letterSpacing: 0.45,
        fontSize: 11.sp,
      ),

      /// for search hint
      labelSmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: KColors.whiteColor,
        letterSpacing: 0.45,
        fontSize: 11.sp,
      ),

      /// button style
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        color: KColors.whiteColor,
        fontSize: 13.sp,
      ),

      /// button style small
      labelMedium: TextStyle(
        fontWeight: FontWeight.w600,
        color: KColors.whiteColor,
        fontSize: 12.sp,
      ),

      /// for appbar
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        letterSpacing: 0.45,
        color: KColors.whiteColor,
        fontSize: 14.sp,
      ),

      /// for headings
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        color: KColors.whiteColor,
      ),

      /// for headings
      titleSmall: TextStyle(
        fontWeight: FontWeight.w700,
        color: KColors.whiteColor,
        fontSize: 17.sp,
      ),
    ),
  );
}


/* 
AnnotatedRegion<SystemUiOverlayStyle>(
value: SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
),
*/