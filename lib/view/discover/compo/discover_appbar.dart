import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/tools/melody_util.dart';
import '../../profile/compo/profile_avatar.dart';
import 'discover_textfield.dart';

class DiscoverAppbar extends StatelessWidget {
  const DiscoverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: false,
      // forceElevated: true,
      floating: false,
      pinned: false,
      title: Text(
        "Discover",
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      // backgroundColor: Colors.white,
      // actions: <Widget>[
      //   IconButton(
      //     icon: const Icon(Icons.camera_alt_outlined),
      //     onPressed: () {},
      //   ),
      // ],
      leadingWidth: 50,
      leading: IconButton(
        onPressed: () {},
        icon: ProfileAvatar(
          avatarUrl: MelodyUtils.kAvatar,
          heightWidth: 30.sp,
        ),
      ),
      // expandedHeight: 2 * kToolbarHeight,
      // flexibleSpace: Padding(
      //   padding: const EdgeInsets.only(top: kToolbarHeight),
      //   child: Padding(
      //     padding: const EdgeInsets.all(4.0).copyWith(top: kToolbarHeight),
      //     child: const DiscoverTextfield(),
      //   ),
      // ),
    );
  }
}

class DiscoverAppbarDelegate extends SliverPersistentHeaderDelegate {
  final void Function() onTap;
  final double expandedHeight;
  const DiscoverAppbarDelegate({
    required this.expandedHeight,
    required this.onTap,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // final deadline = (expandedHeight + minExtent);
    // double percent = shrinkOffset > deadline ? 1 : shrinkOffset / deadline;
    // final appBarSize = expandedHeight - shrinkOffset;
    return DiscoverTextfield(
      onTap: onTap,
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;
  @override
  double get minExtent => kToolbarHeight;
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
