import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ApiService {
  final Ref _ref;
  final Dio _dio;
  ApiService(this._ref, this._dio);

  /// Discovery APIs End Points
  // final _routes = DiscoveryRoutes.instance;
  // static const basePHPUrl = 'https://allevents.in/api/index.php';
}
