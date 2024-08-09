import 'dart:developer';
import 'dart:math' as math;

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/appbar/melody_appbar.dart';
import '../../../components/k_fetching.dart';
import '../../../melody_app/melody_app.dart';
import '../../../services/app_services/app_router.dart';
import '../../../utils/constants/k_assets.dart';
import '../../../utils/constants/k_colors.dart';
import '../../../utils/constants/k_routes.dart';
import '../../home/provider/home_provider.dart';

class AccountScreen extends HookConsumerWidget {
  static const String id = KRoutes.accountScreen;
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController search = useTextEditingController();
    useEffect(() {
      log("${ref.read(goRouting).routeInformationProvider.value.uri} : Hy there");
      return null;
    }, []);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: CustomMaterialIndicator(
        onRefresh: () async {
          Future.delayed(const Duration(seconds: 10), () {
            ref.read(snackKeyProvider).currentState!.showSnackBar(
                  const SnackBar(content: Text("Hey")),
                );
          });
        }, // Your refresh logic
        durations: const RefreshIndicatorDurations(
          completeDuration: Duration(seconds: 5),
        ),
        backgroundColor: Colors.white,
        indicatorBuilder: (context, controller) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: CircularProgressIndicator(
              // color: Colors.redAccent,
              value: !controller.state.isLoading
                  ? math.min(controller.value, 1.0)
                  : null,
            ),
          );
        },
        child: CustomScrollView(
          slivers: [
            // Sbh(h: 200.sp),
            MelodyAppbar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: KColors.whiteColor,
                ),
              ),
              actions: const [],
              title: "Account",
            ),
            // SliverToBoxAdapter(child: ),
            // SliverToBoxAdapter(child: Sbh(h: 10.sp)),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  CupertinoSearchTextField(
                    controller: search,
                    backgroundColor:
                        CupertinoColors.tertiarySystemFill.withOpacity(.3),
                    prefixIcon: Image.asset(
                      KAssets.search,
                      color: KColors.whiteColor,
                      scale: 35,
                    ),
                  ),
                  ref.watch(categoryFutureProvider).when(
                    data: (data) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        padding: EdgeInsets.zero,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          final category = data[index];
                          return ListTile(
                            onTap: () {},
                            leading: Text("${index + 1}."),
                            title: Text(category.name.toString()),
                            subtitle: Text(category.slug.toString()),
                            trailing: CircleAvatar(
                              backgroundColor: KColors.grey300,
                              radius: 7,
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      return Text(
                        error.toString(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: KColors.whiteColor,
                            ),
                      );
                    },
                    loading: () {
                      return const EventButtonFetching(
                        color: KColors.whiteColor,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
