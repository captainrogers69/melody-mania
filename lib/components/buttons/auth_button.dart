import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/k_assets.dart';
import '../../utils/constants/k_colors.dart';
import '../k_fetching.dart';

class AuthButton extends StatelessWidget {
  final void Function() onPressed;
  final Color backgroundColor;
  final String asset, title;
  final bool fetching;
  const AuthButton(
      {this.backgroundColor = KColors.transparentColor,
      required this.onPressed,
      required this.fetching,
      required this.asset,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.sp),
      margin: EdgeInsets.symmetric(horizontal: 30.sp),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: title == 'Log in' ? KColors.transparentColor : null,
          backgroundColor: backgroundColor,
          minimumSize: Size(85.w, 50),
          side: BorderSide(
            color: title == 'Log in'
                ? backgroundColor
                : backgroundColor == KColors.transparentColor
                    ? KColors.whiteColor
                    : backgroundColor,
            width: 0.35,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            title == 'Log in'
                ? const SizedBox()
                : asset != ''
                    ? Image.asset(
                        asset,
                        color:
                            asset == KAssets.phone ? KColors.whiteColor : null,
                        scale: asset == KAssets.google ? 30 : 25,
                      )
                    : const SizedBox(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Visibility(
                      visible: fetching,
                      replacement: Text(
                        title,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: EventButtonFetching(
                          horizontalFetch: true,
                          color: KColors.whiteColor,
                          size: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
