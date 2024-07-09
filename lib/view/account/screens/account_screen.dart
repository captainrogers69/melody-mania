import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/constants/k_colors.dart';
import '../../../utils/constants/k_routes.dart';

class AccountScreen extends HookConsumerWidget {
  static const String id = KRoutes.accountScreen;
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: KColors.whiteColor,
        ),
        actionsIconTheme: const IconThemeData(
          color: KColors.whiteColor,
        ),
        title: const Text(
          "Account Screen",
          style: TextStyle(color: KColors.whiteColor),
        ),
      ),
      body: TextButton(
        onPressed: () {
          log(GoRouterState.of(context).path.toString());
          context.pop();
        },
        child: const Text(
          "Go Back Screen",
        ),
      ),
    );
  }
}
