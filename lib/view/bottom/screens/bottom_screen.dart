import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:songbird/components/appbar/melody_appbar.dart';
import 'package:songbird/view/bottom/compo/bottom_bar.dart';

import '../../../utils/constants/k_routes.dart';
import '../../account/screens/account_screen.dart';
import '../../discover/screens/discover_screen.dart';
import '../../home/screens/final_view.dart';
import '../../home/screens/home_screen.dart';
import '../../library/screens/your_library_screen.dart';

// class BottomScreen extends StatefulHookConsumerWidget {
//   const BottomScreen({super.key});
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _BottomScreenState();
// }
// class _BottomScreenState extends ConsumerState<BottomScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class BottomScreen extends StatefulHookConsumerWidget {
  static const String id = KRoutes.bottomScreen;
  const BottomScreen({super.key});

  static final List<Widget> screens = [
    const HomeScreen(),
    const DiscoverScreen(),
    const YourLibraryScreen(),
    const AccountScreen(),
  ];

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomScreenState();
}

class _BottomScreenState extends ConsumerState<BottomScreen> {
  late final ScrollController _scrollController;
  // bool _atBottom = false;
  final bool _isShimmerActive = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Scroll Listener
  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // setState(() {
      //   _atBottom = true;
      // });
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      // setState(() {
      //   _atBottom = false;
      // });
    }
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      // setState(() {
      //   _atBottom = false;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> selectedScreen = useState(1);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: const MelodyAppbar(
        title: "Hey",
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BottomNavBar(
          onSelected: (p0) {},
        ),
      ),
      body: ListView.builder(
        physics: const ClampingScrollPhysics(),
        controller: _scrollController,
        itemCount: 9,
        itemBuilder: (context, index) {
          return BuildSingleItem(
            isShimmerActive: _isShimmerActive,
          );
        },
      ),
    );
    /* return Scaffold(
      // extendBody: true,
      appBar: _appBar(context),
      body: BottomScreen.screens[selectedScreen.value],
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
    ); */
  }
}
