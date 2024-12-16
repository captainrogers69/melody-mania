import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:songbird/view/discover/compo/discover_textfield.dart';

import '../../../components/cache_image.dart';
import '../../../utils/tools/melody_util.dart';

class LibraryAppbar extends HookConsumerWidget {
  const LibraryAppbar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      // title: const Column(
      //   children: [],
      // ),
      expandedHeight: 200,
      // collapsedHeight: kTextTabBarHeight,
      // title: DiscoverTextfield(
      //   onTap: () {},
      // ),
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
            background: CacheImage(
              image: KUtils.kCover,
              width: 100.w,
              height: 42.w,
              roundCorner: 0,
            ),
          ),
          DiscoverTextfield(
            height: 56 + 20,
            onTap: () {},
          ),
        ],
      ),
      centerTitle: true,
      pinned: true,
    );
  }
}
