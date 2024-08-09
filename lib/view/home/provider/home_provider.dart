import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/manager/dio_wrapper.dart';
import '../../../view/home/categpry_item.dart';
import 'category_state.dart';

const String _categoriesUrl =
    "https://allevents.in/api/index.php/mobile_apps/v2/get_all_categories_and_interests";

final categoryFutureProvider =
    FutureProvider.autoDispose<List<CategoryItem>>((ref) async {
  CategoryResponse categoryResponse = CategoryResponse();
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());
  final primeResponse = await DioWrapper.request(
    params: {},
    path: _categoriesUrl,
    cancelToken: cancelToken,
  );
  if (primeResponse.$2.error?.status == 0) {
    categoryResponse = CategoryResponse.fromJson(primeResponse.$1);
    log("${categoryResponse.categories ?? []} uiuiuoioio");
  } else {}
  ref.keepAlive();
  return categoryResponse.categories ?? [];
});

/// ------------------------------------------ // [StateNotifier<DateTime>] // ------------------------------------------ ///
class Clock extends StateNotifier<DateTime> {
  Clock() : super(DateTime.now()) {
    _timer = Timer.periodic(const Duration(seconds: 1), (er) {
      state = DateTime.now();
    });
  }

  late Timer _timer;
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});

/// ------------------------------------------ // [StateNotifier<CategoryState>] // ------------------------------------------ ///

class CategoryNotifier extends StateNotifier<CategoryState> {
  CategoryNotifier() : super(CategoryState.noError());

  Future<void> fetchCategories() async {
    state = CategoryState.fetching();
    await DioWrapper.request(
      path: _categoriesUrl,
      // onResponse: (response, error) {
      //   if (error.error?.status == 0) {
      //     final resp = CategoryResponse.fromJson(response);
      //     state = CategoryState.categories(resp.categories ?? []);
      //   } else {
      //     state = CategoryState.error(error.error!);
      //   }
      // },
      params: {},
    );
    // state = CategoryState.noError();
  }
}

final categoryNotifierProvider =
    StateNotifierProvider<CategoryNotifier, CategoryState>((ref) {
  return CategoryNotifier();
});

/// ------------------------------------------ // [ChangeNotifier] // ------------------------------------------ ///
