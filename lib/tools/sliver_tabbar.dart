import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:songbird/utils/constants/k_colors.dart';

import '../../../utils/constants/k_routes.dart';

class SliverTabbarScreen extends HookConsumerWidget {
  static const String id = KRoutes.homeScreen;
  const SliverTabbarScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TabController tabController = useTabController(initialLength: 2);
    return CupertinoPageScaffold(
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              forceElevated: innerBoxIsScrolled,
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              stretch: true,
              title: const Text("Sliver tabbar"),
              // flexibleSpace: FlexibleSpaceBar(
              //   stretchModes: const [
              //     StretchMode.zoomBackground,
              //     StretchMode.blurBackground,
              //     StretchMode.fadeTitle,
              //   ],
              //   background: CacheImage(image: KUtils.kCover),
              // ),
              bottom: TabBar(
                controller: tabController,
                // labelColor: AppColors.black,
                // unselectedLabelColor: AppColors.gray,
                // indicatorColor: AppColors.primaryColor,
                indicatorWeight: 4,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 16),
                labelPadding: EdgeInsets.zero,
                tabs: const [
                  Text("FIRST"),
                  Text("SECOND"),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          physics: const ClampingScrollPhysics(),
          controller: tabController,
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: 45,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  "$index",
                  style:
                      const TextStyle(fontSize: 20, color: KColors.whiteColor),
                );
              },
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
