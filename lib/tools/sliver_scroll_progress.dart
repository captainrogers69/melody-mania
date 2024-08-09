import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:songbird/utils/constants/k_colors.dart';

import '../../../utils/constants/k_routes.dart';

class SliverScrollProgress extends HookConsumerWidget {
  static const String id = KRoutes.homeScreen;
  const SliverScrollProgress({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController scroll = useScrollController();
    double screenWidth = MediaQuery.of(context).size.width;
    ValueNotifier<double> cWidth = useState(0);
    double itemHeight = 28.0;
    double itemsCount = 20;
    useEffect(() {
      scroll.addListener(() {
        cWidth.value = scroll.offset * screenWidth / (itemHeight * itemsCount);
        dev.log(cWidth.value.toString());
      });
      return () => scroll.removeListener(() {
            cWidth.value =
                scroll.offset * screenWidth / (itemHeight * itemsCount);
            dev.log(cWidth.value.toString());
          });
    }, [scroll]);

    return CustomScrollView(
      controller: scroll,
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          floating: true,
          stretch: true,
          title: Text("Sliver tabbar"),
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [
              // StretchMode.zoomBackground,
              StretchMode.blurBackground,
              StretchMode.fadeTitle,
            ],
            // background:
            // CacheImage(image: KUtils.kCover),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverAppBarDelegate(
            child: AnimatedBuilder(
              animation: scroll,
              builder: (context, child) {
                // double cWidth =
                //     scroll.offset * screenWidth / (itemHeight * itemsCount);

                return Row(
                  children: [
                    Container(
                      height: 24,
                      width: cWidth.value,
                      color: KColors.whiteColor,
                    ),
                    Expanded(
                      child: Container(
                        height: 24,
                        // width: 100.w - cWidth.value,
                        color: KColors.primaryColor,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ListView.builder(
              shrinkWrap: true,
              itemCount: 45,
              // controller: scroll,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  "$index",
                  style:
                      const TextStyle(fontSize: 20, color: KColors.whiteColor),
                );
              },
            ),
          ]),
        ),
      ],
    );
  }

  // void onScroll() {
  //   cWidth.value = controller.offset * screenWidth / (itemHeight * itemsCount);
  // }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    this.expandedHeight = kToolbarHeight,
    required this.child,
  });
  final double expandedHeight;
  final Widget child;

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return true;
    // return maxHeight != oldDelegate.maxHeight ||
    //       minHeight != oldDelegate.minHeight ||
    //       child != oldDelegate.child;
  }
}
