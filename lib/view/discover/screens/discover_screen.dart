import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/k_fetching.dart';
import '../../../config/theme/app_theme.dart';
import '../../../domain/models/response/saavn/search_songs_response.dart';
import '../../../services/app_providers/service_providers.dart';
import '../../../utils/constants/k_colors.dart';
import '../../../utils/constants/k_routes.dart';
import '../compo/discover_appbar.dart';

final browseCategoriesFutureProvider =
    FutureProvider<SongsSearchResponse>((ref) async {
  SongsSearchResponse cate =
      await ref.read(saavnServiceProvider).searchSongwithQuery(query: 'sajni');
  return cate;
});

class DiscoverScreen extends HookConsumerWidget {
  static const String id = KRoutes.discoverScreen;
  const DiscoverScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController scrolling = useScrollController();
    return Scaffold(
      body: SafeArea(
        child: Theme(
          data: AppTheme.darkTheme.copyWith(
              scrollbarTheme: ScrollbarThemeData(
            thumbColor: KColors.fetchMaterial(KColors.whiteColor),
            trackColor: KColors.fetchMaterial(KColors.whiteColor),
          )),
          child: Scrollbar(
            controller: scrolling,
            thumbVisibility: true,
            trackVisibility: true,
            child: CustomScrollView(
              controller: scrolling,
              // physics: const ClampingScrollPhysics(),
              slivers: [
                const DiscoverAppbar(),
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: DiscoverAppbarDelegate(
                    expandedHeight: kToolbarHeight,
                    onTap: () {},
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: true,
                  // fillOverscroll: true,
                  child: ref.watch(browseCategoriesFutureProvider).when(
                    data: (data) {
                      return CommonComponent(data: data);
                    },
                    error: (error, stackTrace) {
                      return Text(
                        "$error popop",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: KColors.whiteColor,
                                ),
                      );
                    },
                    loading: () {
                      return const EventButtonFetching();
                    },
                  ),
                ),
                /* SliverList(delegate: SliverChildBuilderDelegate(// SliverChildListDelegate()
                  childCount: 1,
                  (context, index) {
                    return 
                  },
                ), ), */
                /* SliverToBoxAdapter(
                  child:  
                          
                  ),
                ), */
                // CupertinoScrollbar(
                //   controller: scrolling,
                //   thicknessWhileDragging: 50,
                //   scrollbarOrientation: ScrollbarOrientation.right,
                //   thumbVisibility: true, // Always show the scrollbar
                //   thickness: 16.0, // Make it thicker
                //   radius: const Radius.circular(8.0), // Rounder corners
                //   // trackVisibility: true, // Show track on hover
                //   child: ListView.builder(
                //   ),
                // ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommonComponent extends ConsumerWidget {
  final SongsSearchResponse data;
  const CommonComponent({required this.data, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 20.sp),
          child: Text(
            "Browse Categories",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: KColors.whiteColor,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: 90,
            padding: EdgeInsets.zero,
            // (data.data?.results ?? []).length,
            itemBuilder: (BuildContext context, int index) {
              // return const Text('[]');
              final temp = (data.data?.results ?? [])[0];
              return Text(
                temp.name.toString(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: KColors.whiteColor,
                    ),
              );
            },
          ),
        ),
        // Sbh(h: 40.sp),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 10.sp),
        //   child: ListView.builder(
        //     shrinkWrap: true,
        //     physics: const ClampingScrollPhysics(),
        //     itemCount: 90,
        //     // (data.data?.results ?? []).length,
        //     itemBuilder: (BuildContext context, int index) {
        //       // return const Text('[]');
        //       final temp = (data.data?.results ?? [])[0];
        //       return Text(
        //         temp.name.toString(),
        //         style: Theme.of(context).textTheme.titleMedium!.copyWith(
        //               color: KColors.whiteColor,
        //             ),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}

/* !(data.success ?? false)
                          ? ErrorHolder(
                              message: data.message ?? 'Something went wrong',
                              label: "Reload",
                              onPressed: () async {},
                            )
                          : (data.data?.results ?? []).isEmpty
                              ? ErrorHolder(
                                  message: "Something went wrong",
                                  label: "Reload",
                                  onPressed: () {},
                                )
                              : */