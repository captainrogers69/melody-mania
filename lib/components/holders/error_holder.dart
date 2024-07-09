import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/enums/button_state.dart';
import '../buttons/k_border_button.dart';
import '../sizing_box.dart';

class ErrorHolder extends StatelessWidget {
  final void Function() onPressed;
  final String label, message;
  const ErrorHolder({
    required this.onPressed,
    required this.message,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                message,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const Sbh(h: 12),
              KBorderButton(
                buttonCorner: KButtonCorner.circular,
                buttonType: KButtonType.whiteButton,
                onTap: onPressed,
                label: label,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
