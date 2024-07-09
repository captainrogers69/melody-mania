import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/packages/bottom_bar/tab_item.dart';
import '../../../utils/constants/k_assets.dart';

class BottomProvider with ChangeNotifier {
  final Ref _ref;
  BottomProvider(this._ref);

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
}
