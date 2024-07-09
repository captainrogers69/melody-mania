import 'package:flutter/material.dart';
import 'package:songbird/utils/constants/k_colors.dart';

import '../utils/extensions/melody_extension.dart';

class PopyMenu extends StatelessWidget {
  final List<PopupMenuEntry<int>> popUps;
  final Function(int) onSelected;
  final Color? iconColor;
  final Widget? icon;
  const PopyMenu({
    required this.onSelected,
    required this.popUps,
    this.iconColor,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      surfaceTintColor: KColors.whiteColor,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context) => popUps,
      shadowColor: KColors.whiteColor,
      color: KColors.whiteColor,
      shape: eventStandardShape,
      onSelected: onSelected,
      onOpened: () {},
      elevation: 7,
      icon: icon ??
          Icon(
            Icons.more_vert,
            color: iconColor ?? KColors.whiteColor,
          ),
    );
  }
}
