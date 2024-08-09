import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/k_colors.dart';
import '../../utils/tools/melody_util.dart';
import '../../view/profile/compo/profile_avatar.dart';

class MelodyAppbar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final Widget? leading;
  final String title;
  const MelodyAppbar({
    required this.actions,
    required this.title,
    this.leading,
    super.key,
  });

  @override
  State<MelodyAppbar> createState() => _MelodyAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MelodyAppbarState extends State<MelodyAppbar> {
  ScrollNotificationObserverState? _scrollNotificationObserver;
  bool _scrolledUnder = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    _scrollNotificationObserver = ScrollNotificationObserver.maybeOf(context);
    _scrollNotificationObserver?.addListener(_handleScrollNotification);
  }

  @override
  void dispose() {
    if (_scrollNotificationObserver != null) {
      _scrollNotificationObserver!.removeListener(_handleScrollNotification);
      _scrollNotificationObserver = null;
    }
    super.dispose();
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final bool oldScrolledUnder = _scrolledUnder;
      final ScrollMetrics metrics = notification.metrics;
      switch (metrics.axisDirection) {
        case AxisDirection.up:
          // Scroll view is reversed
          _scrolledUnder = metrics.extentAfter > 0;
        case AxisDirection.down:
          _scrolledUnder = metrics.extentBefore > 0;
        case AxisDirection.right:
        case AxisDirection.left:
          // Scrolled under is only supported in the vertical axis, and should
          // not be altered based on horizontal notifications of the same
          // predicate since it could be a 2D scroller.
          break;
      }

      if (_scrolledUnder != oldScrolledUnder) {
        setState(() {
          // React to a change in MaterialState.scrolledUnder
        });
      }
    }
  }

  static final Widget leadingWidg = IconButton(
    onPressed: () {},
    icon: ProfileAvatar(
      avatarUrl: KUtils.kAvatar,
      heightWidth: 30.sp,
    ),
  );

  @override
  Widget build(BuildContext context) {
    // if (_scrolledUnder) {
    return SliverAppBar(
      snap: false,
      floating: false,
      pinned: true,
      scrolledUnderElevation: 9,
      backgroundColor: KColors.transparentColor,
      title: Text(
        widget.title,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      actions: widget.actions,
      leadingWidth: 50,
      leading: widget.leading ?? leadingWidg,
      flexibleSpace: !_scrolledUnder
          ? null
          : ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(
                  color: KColors.transparentColor,
                ),
              ),
            ),
    );
    // } else {
    //   return AppBar(
    //     // snap: false,
    //     // floating: false,
    //     // pinned: false,
    //     title: Text(
    //       widget.title,
    //       style: Theme.of(context).appBarTheme.titleTextStyle,
    //     ),
    //     actions: widget.actions,
    //     leadingWidth: 50,
    //     leading: widget.leading,
    //   );
    // }
  }
}
