import 'dart:async';

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../../../config/packages/bottom_bar/bottom_floating.dart';
import '../../../services/app_providers/service_providers.dart';
import '../../../utils/constants/k_colors.dart';
import '../../../utils/constants/k_routes.dart';
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
    ValueNotifier<int> selectedScreen = useState(0);
    useEffect(() {
      Future.delayed(const Duration(seconds: 1), () async {
        String storageLocation =
            (await getApplicationDocumentsDirectory()).path;
        await FastCachedImageConfig.init(
            subDir: storageLocation, clearCacheAfter: const Duration(days: 5));
      });
      return null;
    }, []);
    // ValueNotifier<String> paramsHolder = useState("No Params found yet");
/*     useEffect(() {
      StreamSubscription<Map> streamSubscription =
          FlutterBranchSdk.listSession().listen(
        (data) {
          if (data.containsKey("+clicked_branch_link") &&
              data["+clicked_branch_link"] == true) {
            //Link clicked. Add logic to get link data
            log('Custom string: ${data["custom_string"]}');
            paramsHolder.value = "custom string: ${data['custom_string']}";
          } else {
            paramsHolder.value = "custom string: $data";
          }
        },
        onError: (error) {
          log('listSession error: ${error.toString()}');
        },
        onDone: () {
          log("Flutter sdk on done method called");
        },
      );
      return () {
        streamSubscription.cancel();
      };
    }, [paramsHolder]); */

    return Scaffold(
      body: screens[selectedScreen.value],
      bottomNavigationBar: BottomBarFloating(
        items: ref.watch(bottomProvider).bottomItems(selectedScreen.value),
        // items: ref.watch(bottomProvider).bottomItems(4),
        onTap: (index) => selectedScreen.value = index,
        borderRadius: BorderRadius.circular(12),
        backgroundColor: KColors.primaryColor,
        titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 9.sp,
            ),
        indexSelected: selectedScreen.value,
        colorSelected: KColors.blackColor,
        color: KColors.whiteColor,
        paddingVertical: 24,
      ),
    );
  }
}
