import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'background_wave_clipper.dart';

class CurvedSliverAppBar extends SliverPersistentHeaderDelegate {
  const CurvedSliverAppBar();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustedShrinkOffset =
        shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) * 0.5;
    double topPadding = MediaQuery.of(context).padding.top + 16;

    return Stack(
      children: [
        BackgroundWave(
          height: 280.sp,
        ),
        Positioned(
          top: topPadding + offset,
          left: 16.sp,
          right: 16.sp,
          child: const SearchBar(),
        )
      ],
    );
  }

  @override
  double get maxExtent => 280;

  @override
  double get minExtent => 140;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}

class SearchBar extends StatelessWidget {
  final pink = const Color(0xFFFACCCC);
  final grey = const Color(0xFFF2F2F7);

  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w - 32.sp,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusColor: pink,
          focusedBorder: _border(pink),
          border: _border(grey),
          enabledBorder: _border(grey),
          hintText: 'Start brand search',
          contentPadding: EdgeInsets.symmetric(vertical: 10.sp),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        onFieldSubmitted: (value) {},
      ),
    );
  }

  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: color),
        borderRadius: BorderRadius.circular(12),
      );
}
