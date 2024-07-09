import 'dart:io';

import 'package:flutter/material.dart';

import '../../../utils/tools/melody_util.dart';
import '../../../view/profile/compo/profile_avatar.dart';
import 'discover_textfield.dart';

class DiscoverAppbar extends StatelessWidget {
  final double offset;
  const DiscoverAppbar({required this.offset, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      // backgroundColor: appbarColor,
      centerTitle: Platform.isIOS,
      // scrolledUnderElevation: 10,
      pinned: true,
      snap: false,
      // elevation: 10,
      leading: IconButton(
        onPressed: () {},
        icon: ProfileAvatar(
          avatarUrl: MelodyUtils.kAvatar,
        ),
      ),
      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: (1.0 - (offset / kToolbarHeight)) < 1 &&
                (1.0 - (offset / kToolbarHeight)) > 0
            ? (1.0 - (offset / kToolbarHeight))
            : 1,
        child: Text(
          "Discover",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        // title: DiscoverTextfield(),
        title: Text(
          "Discover",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: Icon(
      //       Icons.camera_alt,
      //       color: KColors.whiteColor,
      //     ),
      //   ),
      // ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(
          AppBar().preferredSize.height + 10,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: DiscoverTextfield(),
        ),
      ),
    );
  }
}
