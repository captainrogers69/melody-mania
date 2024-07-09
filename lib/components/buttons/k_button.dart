import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/constants/k_colors.dart';
import '../../utils/enums/button_state.dart';
import '../sizing_box.dart';

class KButton extends StatelessWidget {
  final double? width, height, roundCorner;
  final Color? buttonColor, labelColor;
  final double? labelSize, spinkitSize;
  final KButtonCorner? buttonCorner;
  final KButtonState? buttonState;
  final KButtonType? buttonType;
  final void Function()? onTap;
  final String label, asset;
  final Color? spinkitColor;
  const KButton(
      {this.spinkitColor,
      required this.label,
      required this.onTap,
      this.buttonCorner,
      this.buttonState,
      this.buttonColor,
      this.roundCorner,
      this.spinkitSize,
      this.buttonType,
      this.labelColor,
      this.asset = '',
      this.labelSize,
      this.height,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonTheme(
          buttonColor: buttonColor ??
              (buttonType == KButtonType.primaryButton
                  ? KColors.primaryColor
                  : buttonType == KButtonType.successButton
                      ? KColors.successColor
                      : buttonType == KButtonType.errorButton
                          ? KColors.errorColor
                          : buttonType == KButtonType.disabledButton
                              ? KColors.grey500
                              : buttonType == KButtonType.whiteButton
                                  ? KColors.whiteColor
                                  : KColors.primaryColor),
          child: MaterialButton(
            // elevation: 0,
            elevation: buttonColor != KColors.grey500 ||
                    buttonType == KButtonType.disabledButton
                ? 0
                : 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                roundCorner ??
                    (buttonCorner == KButtonCorner.circular
                        ? 31
                        : buttonCorner == KButtonCorner.rounded
                            ? 15
                            : buttonCorner == KButtonCorner.mid
                                ? 10
                                : buttonCorner == KButtonCorner.standard
                                    ? 5
                                    : 2),
              ),
            ),
            onPressed: onTap,
            height: height ?? 42,
            minWidth: width ?? 33.w,
            color: buttonColor ??
                (buttonType == KButtonType.primaryButton
                    ? KColors.primaryColor
                    : buttonType == KButtonType.successButton
                        ? KColors.successColor
                        : buttonType == KButtonType.errorButton
                            ? KColors.errorColor
                            : buttonType == KButtonType.disabledButton
                                ? KColors.grey500
                                : buttonType == KButtonType.whiteButton
                                    ? KColors.whiteColor
                                    : KColors.primaryColor),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: buttonState == KButtonState.processing
                  ? [
                      SpinKitThreeBounce(
                        color: spinkitColor ?? KColors.whiteColor,
                        size: spinkitSize ?? 20,
                      ),
                    ]
                  : asset != ''
                      ? [
                          Image.asset(
                            asset,
                            color: KColors.whiteColor,
                            height: 16,
                          ),
                          const Sbw(w: 8),
                          Text(
                            label,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: labelColor ?? KColors.whiteColor,
                                  fontSize: labelSize ?? 12.sp,
                                ),
                          ),
                        ]
                      : [
                          Text(
                            label,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: labelColor ?? KColors.whiteColor,
                                  fontSize: labelSize ?? 12.sp,
                                ),
                          ),
                        ],
            ),
          ),
        ),
      ],
    );
  }
}
