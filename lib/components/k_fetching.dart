import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/constants/k_colors.dart';

class EventButtonFetching extends StatelessWidget {
  final bool horizontalFetch;
  final Color? color;
  final double? size;
  const EventButtonFetching({
    this.horizontalFetch = false,
    this.size = 30,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: horizontalFetch
          ? SpinKitThreeBounce(
              color: color ?? KColors.primaryColor,
              size: size ?? 30,
            )
          : SpinKitCircle(
              color: color ?? KColors.primaryColor,
              size: size ?? 60,
            ),
    );
  }
}
