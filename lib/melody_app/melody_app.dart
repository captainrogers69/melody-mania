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
        return MaterialApp.router(
          title: 'Songbird',
          theme: AppTheme.darkTheme,
          darkTheme: AppTheme.darkTheme,
          routerConfig: ref.read(goRouting),
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: ref.read(snackProvider),
          // routeInformationParser: ref.read(goRouting).routeInformationParser,
          // routerDelegate: ref.read(goRouting).routerDelegate,
        );
      },
    );
  }
}

/// This Provider returns the [GlobalKey<ScaffoldMessengerState>] which can display the snackbar/toast
/// Use this [currentState?.showSnackBar(SnackBar(content: Text("Snackbar Display"));]
final snackProvider = Provider<GlobalKey<ScaffoldMessengerState>>((ref) {
  final GlobalKey<ScaffoldMessengerState> snackBarKey =
      GlobalKey<ScaffoldMessengerState>();
  return snackBarKey;
});
