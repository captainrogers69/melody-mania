import 'package:flutter/material.dart';

import '../../../config/packages/bottom_bar/bottom_item.dart';
import '../../../config/packages/floating_bar.dart/floating_bar.dart';
import '../../../utils/constants/k_assets.dart';

class BottomProvider with ChangeNotifier {
  // final Ref _ref;
  BottomProvider(/* this._ref */);

  List<TabItem> bottomItems(int selected) {
    return [
      const TabItem(
        // asset: selected == 0 ? KAssets.homefill : KAssets.home,
        asset: KAssets.home,
        title: 'Home',
      ),
      const TabItem(
        asset: KAssets.search,
        title: 'Search',
      ),
      const TabItem(
        asset: KAssets.library,
        title: 'Library',
      ),
      const TabItem(
        // asset: selected == 3 ? KAssets.accountfill : KAssets.account,
        asset: KAssets.account,
        title: 'Account',
      ),
    ];
  }

  List<NavBarItems> bottomFloatingItems(int selectedBottom) {
    return [
      NavBarItems(
        isActive: selectedBottom == 0 ? true : false,
        icon: KAssets.home,
        title: "Home",
      ),
      NavBarItems(
        isActive: selectedBottom == 1 ? true : false,
        icon: KAssets.search,
        title: "For you",
      ),
      NavBarItems(
        isActive: selectedBottom == 2 ? true : false,
        icon: KAssets.library,
        title: "Interests",
      ),
      NavBarItems(
        isActive: selectedBottom == 3 ? true : false,
        icon: KAssets.account,
        title: "Profile",
      ),
    ];
  }

  /* List<BottomNavigationBarItem> bottomNavItems(int selected) {
    return [
      BottomNavigationBarItem(icon: icon,
        label: 'Home',
      )
    ];
  } */
}
