import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/packages/floating_bar.dart/floating_bar.dart';
import '../../../services/app_providers/service_providers.dart';
import '../../../utils/constants/k_colors.dart';
import '../../../utils/constants/k_routes.dart';
import '../../../utils/tools/melody_util.dart';
import '../../account/screens/account_screen.dart';
import '../../discover/screens/discover_screen.dart';
import '../../home/screens/home_screen.dart';
import '../../library/screens/your_library_screen.dart';

class BottomScreen extends HookConsumerWidget {
  static const String id = KRoutes.bottomScreen;
  const BottomScreen({super.key});

  static final List<Widget> screens = [
    const HomeScreen(),
    const DiscoverScreen(),
    const YourLibraryScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<int> selectedScreen = useState(1);
    return Scaffold(
      // extendBody: true,
      body: screens[selectedScreen.value],
      backgroundColor: KColors.blackColor,
      bottomNavigationBar: SafeArea(
        bottom: true,
        top: false,
        child: FloatingNavigationBar(
          iconSize: 20.0,
          barHeight: 60.sp,
          indicatorHeight: 6.5,
          indicatorWidth: 41.5,
          accountPicture: KUtils.kAvatar,
          activeColor: KColors.primaryColor,
          inactiveColor: KColors.whiteColor,
          indicatorColor: KColors.primaryColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: ref
              .watch(bottomProvider)
              .bottomFloatingItems(selectedScreen.value),
          onChanged: (index) => selectedScreen.value = index,
        ),
      ),
      /* BottomAppBar(
          elevation: 9,
          color: KColors.transparentColor,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15.0,
                sigmaY: 15.0,
              ),
              child: MyWidget(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                items: ref
                    .watch(bottomProvider)
                    .bottomFloatingItems(selectedScreen.value),
                onChanged: (index) => selectedScreen.value = index,
              ),
            ),
          ),
      ), */
      /* bottomNavigationBar: BottomBarFloating(
        items: ref.watch(bottomProvider).bottomItems(selectedScreen.value),
        // items: ref.watch(bottomProvider).bottomItems(4),
        onTap: (index) => selectedScreen.value = index,
        borderRadius: BorderRadius.circular(12),
        backgroundColor: KColors.primaryColor,
        titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w700,
        ),
        indexSelected: selectedScreen.value,
        colorSelected: KColors.whiteColor,
        color: KColors.blackColor,
        paddingVertical: 24,
      ), */
    );
  }
}
/* 
class MyWidget extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final List<NavBarItems> items;
  final Color? backgroundColor;
  const MyWidget({
    required this.backgroundColor,
    required this.onChanged,
    required this.items,
    super.key,
  });

  static ValueNotifier<int> notifyIndex = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        items.length,
        (i) => GestureDetector(
          onTap: () => onPressed(i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            // color: KColors.whiteColor,
            child: Column(
              children: [
                Container(
                  height: 3,
                  width: 80.sp,
                  // width: 105.sp,
                  decoration: BoxDecoration(
                    color: !items[i].isActive
                        ? backgroundColor
                        : KColors.primaryColor,
                    borderRadius: eventRadiusStan,
                  ),
                ),
                Sbh(h: 5.sp),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        items[i].icon,
                        height: 25,
                        width: 25,
                        color: items[i].isActive
                            ? KColors.primaryColor
                            : KColors.whiteColor,
                      ),
                      Text(
                        items[i].title,
                        style: Kstyles.kVerySmallTextStyle.copyWith(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                          color: KColors.whiteColor,
                          // fontWeight: items[i].isActive ? FontWeight.w800
                          // color: item.isActive ? KColors.primaryColor : KColors.whiteColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPressed(int index) {
    onChanged(index);
    notifyIndex.value = index;
  }
}
 */