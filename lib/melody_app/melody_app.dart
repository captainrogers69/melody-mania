import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../config/theme/app_theme.dart';
import '../services/app_services/app_router.dart';

class MelodyApp extends HookConsumerWidget {
  const MelodyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      //430 × 932   //1290 × 2796
      designSize: MediaQuery.sizeOf(context),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MaterialApp.router(
            title: 'Songbird',
            theme: AppTheme.darkTheme,
            darkTheme: AppTheme.darkTheme,
            routerConfig: ref.read(goRouting),
            debugShowCheckedModeBanner: false,
            scrollBehavior: ScrollBehaviorModified(),
            scaffoldMessengerKey: ref.read(snackKeyProvider),
            // routeInformationParser: ref.read(goRouting).routeInformationParser,
            // routerDelegate: ref.read(goRouting).routerDelegate,
          ),
        );
      },
    );
  }
}

/// This Provider returns the [GlobalKey<ScaffoldMessengerState>] which can display the snackbar/toast

/// Use this [currentState?.showSnackBar(SnackBar(content: Text("Snackbar Display"));]
final snackKeyProvider = Provider<GlobalKey<ScaffoldMessengerState>>((ref) {
  final GlobalKey<ScaffoldMessengerState> snackBarKey =
      GlobalKey<ScaffoldMessengerState>();
  return snackBarKey;
});

// final snackProvider = Provider.family<
//     ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?,
//     String>((ref, message) {
//   final snackKey = ref.read(snackKeyProvider);
//   final snack = SnackBar(content: Text(message));
//   return snackKey.currentState?.showSnackBar(snack);
// });
// final snackingProvider = Provider<SnackBar, String>((ref, msg) {
//   return SnackBar(content: Text(msg));
// });

class ScrollBehaviorModified extends CupertinoScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return CustomScrollPhysics();
  }

  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return StretchingOverscrollIndicator(
      axisDirection: details.direction,
      child: child,
    );
  }
}

class CustomScrollPhysics extends ClampingScrollPhysics {
  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // ignore: deprecated_member_use
    final Tolerance tolerance = this.tolerance;
    if (velocity.abs() >= tolerance.velocity || position.outOfRange) {
      return BouncingScrollSimulation(
        spring: spring,
        position: position.pixels,
        velocity: velocity,
        leadingExtent: position.minScrollExtent,
        trailingExtent: position.maxScrollExtent,
        tolerance: tolerance,
      );
    }
    return null;
  }
}
