import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/constants/k_routes.dart';

class HomeScreen extends HookConsumerWidget {
  static const String id = KRoutes.homeScreen;
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
