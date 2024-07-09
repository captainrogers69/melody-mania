import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../../components/cache_image.dart';
import '../../../components/holders/error_holder.dart';
import '../../../components/k_fetching.dart';
import '../../../domain/models/response/browse_category_resp.dart';
import '../../../services/app_providers/service_providers.dart';
import '../../../utils/constants/k_routes.dart';
import '../../../utils/extensions/melody_extension.dart';
import '../compo/discover_appbar.dart';

final browseCategoriesFutureProvider =
    FutureProvider<BrowseCategoriesResponse>((ref) async {
  BrowseCategoriesResponse cate =
      await ref.read(spotifyServiceProvider).fetchCategoriesList();
  return cate;
});

class DiscoverScreen extends HookConsumerWidget {
  static const String id = KRoutes.discoverScreen;
  const DiscoverScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController scrolling = useScrollController();
    ValueNotifier<double> scrollOffset = useState(0);
    browseCategoriesFutureProvider;
    // useEffect(() {
    //   ref.read(spotifyServiceProvider).fetchCategoriesList();
    //   return null;
    // }, []);
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            scrollOffset.value = notification.scrollDelta ?? 0;
          }
          return true;
        },
        child: CustomScrollView(
          slivers: [
            DiscoverAppbar(offset: scrollOffset.value),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ref.watch(browseCategoriesFutureProvider).when(
                    data: (data) {
                      // List<Color> colors = generateRandomPrimaryColors(
                      //     (data.categories?.items ?? []).length);
                      return data.errorCode == 1
                          ? ErrorHolder(
                              message: data.errorMessage.toString(),
                              label: "Reload",
                              onPressed: () {
                                ref.read(spotifyServiceProvider).refreshToken();
                              },
                            )
                          : (data.categories?.items ?? []).isEmpty
                              ? ErrorHolder(
                                  message: "Something went wrong",
                                  label: "Reload",
                                  onPressed: () {},
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                              horizontal: 10.sp)
                                          .copyWith(top: 20.sp),
                                      child: Text(
                                        "Browse Categories",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.sp),
                                      child: StaggeredGridView.countBuilder(
                                        primary: false,
                                        shrinkWrap: true,
                                        crossAxisCount: 2,
                                        controller: scrolling,
                                        mainAxisSpacing: 13.sp,
                                        crossAxisSpacing: 14.sp,
                                        staggeredTileBuilder: (int index) =>
                                            const StaggeredTile.fit(1),
                                        itemCount:
                                            (data.categories?.items ?? [])
                                                .length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final temp =
                                              (data.categories?.items ??
                                                  [])[index];
                                          return Container(
                                            height: 100.sp,
                                            decoration: BoxDecoration(
                                              borderRadius: eventRadiusSmaller,
                                              // color: colors[index],
                                            ),
                                            child: Stack(
                                              fit: StackFit.expand,
                                              children: [
                                                // Transform.rotate(
                                                //   angle: math.pi / 4,
                                                CacheImage(
                                                  image: temp.icons!.first.url!,
                                                  roundCorner: 5,
                                                  height: 20.sp,
                                                  width: 20.sp,
                                                ),
                                                // ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Text(
                                                    temp.name.toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                    },
                    error: (error, stackTrace) {
                      return Text(error.toString());
                    },
                    loading: () {
                      return const EventButtonFetching();
                    },
                  ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
