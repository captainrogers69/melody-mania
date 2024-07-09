import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/k_route_error.dart';
import '../../melody_app/splash_screen.dart';
import '../../utils/constants/k_routes.dart';
import '../../view/account/screens/account_screen.dart';
import '../../view/auth/screens/auth_screen.dart';
import '../../view/bottom/screens/bottom_screen.dart';
import '../../view/discover/screens/discover_screen.dart';
import '../../view/library/screens/your_library_screen.dart';

/*
MyAppRouterConfig.rootNavigatorKey.currentContext?.pushNamed(
      MyAppRoutes.notificationResponsePage,
      extra: VisitorFromNotification.fromMap(jsonDecode(de
*/

final goRouting = Provider<GoRouter>((ref) {
  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  return GoRouter(
    initialLocation: "/",
    navigatorKey: navigationKey,
    observers: [
      KNavigatorObserver(),
    ],
    routes: <RouteBase>[
      GoRoute(
        name: KRoutes.splashScreen,
        path: '/',
        builder: (context, state) {
          log("Splash Screen parameters :${state.pathParameters} :: Splash Path: ${GoRouterState.of(context).uri}");
          // final visitorFromNotification =
          //     state.extra! as VisitorFromNotification;
          return const SplashScreen();
        },
      ),
      GoRoute(
        name: KRoutes.authScreen,
        path: KRoutes.authScreen,
        builder: (context, state) {
          log("Auth Screen parameters :${state.pathParameters} :: Auth Path: ${GoRouterState.of(context).uri}");
          return const AuthScreen();
        },
      ),
      GoRoute(
        name: KRoutes.bottomScreen,
        path: KRoutes.bottomScreen,
        builder: (BuildContext context, GoRouterState state) {
          log("Bottom Screen parameters :${state.pathParameters} :: Bottom Path: ${GoRouterState.of(context).uri}");
          return const BottomScreen();
        },
      ),
      GoRoute(
        name: KRoutes.accountScreen,
        path: KRoutes.accountScreen,
        builder: (context, state) {
          log("Account Screen parameters :${state.pathParameters} :: Account Path: ${GoRouterState.of(context).uri}");
          return const AccountScreen();
        },
      ),
      GoRoute(
        name: KRoutes.yourLibraryScreen,
        path: KRoutes.yourLibraryScreen,
        builder: (context, state) {
          log("Your Library parameters :${state.pathParameters} :: Your Library Path: ${GoRouterState.of(context).uri}");
          return const YourLibraryScreen();
        },
      ),
      GoRoute(
        name: KRoutes.discoverScreen,
        path: KRoutes.discoverScreen,
        builder: (context, state) {
          log("Discover parameters :${state.pathParameters} :: Discover Path: ${GoRouterState.of(context).uri}");
          return const DiscoverScreen();
        },
      ),
    ],
    errorBuilder: (context, state) {
      log("Route context widget: ${context.widget} :: context error: ${state.error} ");
      return const RouteError();
    },
  );
});
/* pageBuilder: (context, animation, secondaryAnimation) => WebViewScreen(item: item),
transitionsBuilder: (context, animation, secondaryAnimation, page) {
  var begin = 0.8;
  var end = 1.0;
  var curve = Curves.easeInOut;
  var scaleTween =
      Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  var fadeTween = Tween<double>(begin: 0.0, end: 1.0);
  return ScaleTransition(
    scale: animation.drive(scaleTween),
    child: FadeTransition(
      opacity: animation.drive(fadeTween),
      child: page,
    ),
  );
}, */

class KNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('======================= Did push route ${route.currentResult}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('======================= Did Pop route ${route.currentResult}');
  }
}
