// import 'dart:developer' as dev;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/cache_image.dart';
import '../../../components/sizing_box.dart';
import '../../../utils/constants/k_assets.dart';
import '../../../utils/constants/k_colors.dart';
import '../../../utils/constants/k_routes.dart';
import '../../../utils/constants/k_styles.dart';
import '../../../utils/tools/melody_util.dart';

class YourLibraryScreen extends HookConsumerWidget {
  static const String id = KRoutes.homeScreen;
  const YourLibraryScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ScrollController controller = useScrollController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: KColors.whiteColor,
      body: CustomScrollView(
        // controller: controller,
        // physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300.0,
            backgroundColor: KColors.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: CacheImage(
                image: KUtils.kCover,
                width: 100.w,
                height: 42.w,
                roundCorner: 0,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.sp),
                  child: const AddressHomeHeader(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () async {
                      context.push(KRoutes.accountScreen);
                    },
                    icon: Badge(
                      label: Text(
                        "3",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: KColors.whiteColor,
                              fontSize: 9.sp,
                            ),
                      ),
                      largeSize: 13.5.sp,
                      backgroundColor: KColors.errorColor,
                      child: const Icon(
                        Icons.notifications,
                        color: KColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SliverAppBar(
            pinned: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: CupertinoSearchTextField(
                backgroundColor: KColors.whiteColor,
              ),
            ),
          ),
          /* SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: DiscoverAppbarDelegate(
              expandedHeight: kToolbarHeight,
              onTap: () {
                ref.read(snackKeyProvider).showingSnackBar("Hey you ");
                // ref.read(snackProvider("Hey there buddy "));
                // context.showSnackBar("Hey tehrer your");
              },
            ),
          ), */
          /* SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: SliverAppBarDelegate(
              child: CacheImage(
                image: KUtils.kCover,
                width: 100.w,
                height: 42.w,
                roundCorner: 0,
              ),
            ),
          ), */
          /* SliverAppBar(
            expandedHeight: 100.w * 5 / 4 - 25.sp,
            pinned: true,
            floating: false,
            // toolbarHeight: 114,
            backgroundColor: Colors.transparent,
            elevation: 0,
            // title: ,
            flexibleSpace: const Stack(
              children: [
                // CacheImage(
                //   image: KUtils.kCover,
                //   width: 100.w,
                //   height: 42.w,
                //   roundCorner: 0,
                // ),
                // FlexibleSpaceBar(
                //   collapseMode: CollapseMode.pin,
                //   background: InkWell(
                //     onTap: () {},
                //     child: Image.asset(
                //       KAssets.simular,
                //       height: 100.w * 5 / 4,
                //       fit: BoxFit.fitWidth,
                //       // roundCorner: 0,
                //       width: 100.w,
                //     ),
                //   ),
                // ),
              ],
            ),
          ), */
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Text(
                  "$index",
                  style: const TextStyle(
                    color: KColors.whiteColor,
                    fontSize: 20,
                  ),
                );
              },
            ),
            /* delegate: SliverChildListDelegate([
              ListView.builder(
                shrinkWrap: true,
                itemCount: 45,
                // controller: scroll,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    "$index",
                    style: const TextStyle(
                      color: KColors.whiteColor,
                      fontSize: 20,
                    ),
                  );
                },
              ),
            ]), */
          ),
        ],
      ),
    );
  }
}

class AddressHomeHeader extends HookConsumerWidget {
  final ScrollController? scroller;
  // final Image? hex;
  const AddressHomeHeader({this.scroller, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {},
      splashColor: KColors.transparentColor,
      highlightColor: KColors.transparentColor,
      child: const TempAddressHomeHeader(
        // hex: hex,
        currentCity: "Moradabad",
      ),
    );
  }
}

class TempAddressHomeHeader extends StatelessWidget {
  final String currentCity;
  // final Image? hex;
  const TempAddressHomeHeader({required this.currentCity, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Hero(
          tag: 'Hye Hex',
          child: Image.asset(
            KAssets.hexBottom,
            // color: darkPrimary,
            // scale: 2.5,
            scale: 10,
            // scale: 1.5, // 2.5,
          ),
        ),
        const Sbw(w: 6),
        Text(
          currentCity,
          style: Kstyles.kSubHeadingStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: KColors.whiteColor,
            fontSize: 12.sp,
          ),
        ),
        const Sbw(w: 5),
        const Icon(
          Icons.arrow_drop_down,
          color: KColors.whiteColor,
        )
      ],
    );
  }
}

class HomeSearchBar extends StatelessWidget {
  // final TextEditingController controller;
  final void Function()? /* onFilter, */ onTap;
  final double? vertMargin, horizontal;
  final String hintText;
  final bool enabled;
  const HomeSearchBar(
      { //required this.controller,
      /* this.onFilter, */
      required this.hintText,
      required this.enabled,
      this.horizontal = 10,
      this.vertMargin = 5,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      splashColor: KColors.transparentColor,
      highlightColor: KColors.transparentColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontal!),
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  surfaceContainerHighest: Colors.transparent,
                ),
          ),
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5)
                  .copyWith(bottom: 8.sp),
              padding:
                  const EdgeInsets.symmetric(horizontal: 8).copyWith(right: 0),
              height: 32.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                // border: Border.all(
                //   color: midGreyColor,
                // ),
                color: KColors.whiteColor,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Sbw(w: 12.sp),
                      Image.asset(
                        KAssets.search22,
                        color: KColors.primaryTextGreyColor,
                        scale: 25,
                      ),
                      Sbw(w: 12.sp),
                      Opacity(
                        opacity: 0.8,
                        child: Text(
                          hintText,
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: KColors.primaryTextGreyColor,
                                    fontSize: 11.sp,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
