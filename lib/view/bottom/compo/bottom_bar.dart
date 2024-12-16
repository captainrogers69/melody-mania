import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:navigation_view/item_navigation_view.dart';
import 'package:navigation_view/navigation_view.dart';
import 'package:songbird/utils/constants/k_colors.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int) onSelected;
  const BottomNavBar({required this.onSelected, super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: NavigationView(
          onChangePage: onSelected,
          curve: Curves.fastEaseInToSlowEaseOut,
          durationAnimation: const Duration(milliseconds: 400),
          backgroundColor: KColors.transparentColor,
          color: theme.primaryColor,
          items: [
            ItemNavigationView(
              childAfter: Icon(
                IconlyBold.profile,
                color: theme.primaryColor,
                size: 35,
              ),
              childBefore: Icon(
                IconlyBroken.profile,
                color: theme.dialogBackgroundColor,
                size: 30,
              ),
            ),
            ItemNavigationView(
                childAfter: Icon(
                  IconlyBold.setting,
                  color: theme.primaryColor,
                  size: 35,
                ),
                childBefore: Icon(
                  IconlyBroken.setting,
                  color: theme.dialogBackgroundColor,
                  size: 30,
                )),
            ItemNavigationView(
                childAfter: Icon(
                  IconlyBold.buy,
                  color: theme.primaryColor,
                  size: 35,
                ),
                childBefore: Icon(
                  IconlyBroken.buy,
                  color: theme.dialogBackgroundColor,
                  size: 30,
                )),
            ItemNavigationView(
                childAfter: Icon(
                  IconlyBold.category,
                  color: theme.primaryColor,
                  size: 35,
                ),
                childBefore: Icon(
                  IconlyBroken.category,
                  color: theme.dialogBackgroundColor,
                  size: 30,
                )),
            ItemNavigationView(
                childAfter: Icon(
                  IconlyBold.home,
                  color: theme.primaryColor,
                  size: 35,
                ),
                childBefore: Icon(
                  IconlyBroken.home,
                  color: theme.dialogBackgroundColor,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
