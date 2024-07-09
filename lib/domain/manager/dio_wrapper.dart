import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

import 'dio_error.dart';
import 'dio_factory.dart';
import 'dio_methods.dart';

class DioWrapper {
  static Future<void> request(
      {required Map<String, dynamic> params,
      bool hideLoadingIndicator = false,
      DioMethod method = DioMethod.getr,
      required OnDioResponse onResponse,
      Map<String, dynamic>? headers,
      required String path}) async {
    Map<String, dynamic> dioHeaders = headers ?? {};
    dioHeaders[HttpHeaders.contentTypeHeader] = "application/json";

    try {
      dio.Response response;
      switch (method) {
        case DioMethod.post:
          response = await DioFactory.dio!.post(
            path,
            options: Options(
              headers: dioHeaders,
            ),
            data: params,
          );
          break;
        case DioMethod.delete:
          response = await DioFactory.dio!.delete(
            path,
            data: params,
            options: Options(
              headers: dioHeaders,
            ),
          );
          break;
        case DioMethod.getr:
          response = await DioFactory.dio!.get(
            path,
            queryParameters: params,
            options: Options(
              headers: dioHeaders,
            ),
          );
          break;
        case DioMethod.patch:
          response = await DioFactory.dio!.patch(
            path,
            data: params,
            options: Options(
              headers: dioHeaders,
            ),
          );
          break;
        case DioMethod.put:
          response = await DioFactory.dio!.put(
            path,
            data: params,
            options: Options(
              headers: headers,
            ),
          );
          break;
        default:
          return;
      }

      onResponse(
        response.data,
        DioErrorResponse(
          error: ErrorResponse(
            message: "",
            status: 0,
          ),
        ),
      );
      // onError(DioErrorResponse(
      //     error: ErrorResponse(
      //   message: "",
      //   status: 0,
      // )));
    } catch (e) {
      log('Error message : $e');
      String errorMessage = "";

      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          // errorMessage = 'Server unreachable';
          onResponse(
              null,
              DioErrorResponse(
                  error: ErrorResponse(
                message: "Server unreachable",
                status: 1,
              )));
        } else if (e.type == DioExceptionType.badResponse) {
          if (e.response!.statusCode == 401) {
            // DioFactory.initialiseHeaders('');
            onResponse(
                null,
                DioErrorResponse(
                    error: ErrorResponse(
                  message: e.response!.data['error']['message'].toString(),
                  status: 1,
                )));
            // Get.off(const SignUpPage());
            return;
          } else {
            onResponse(
                null,
                DioErrorResponse(
                    error: ErrorResponse(
                  message: e.response!.data['message'],
                  status: 1,
                )));
            errorMessage = e.response!.data['message'];
          }

          // errorMessage = e.response!.data['detail'];
        } else {
          // errorMessage = "Request cancelled";
          onResponse(
              null,
              DioErrorResponse(
                  error: ErrorResponse(
                message: "Request cancelled",
                status: 1,
              )));
        }
      } else {
        errorMessage = "Something went wrong! Please try again.";
        onResponse(
            null,
            DioErrorResponse(
                error: ErrorResponse(
              message: "Something went wrong! Please try again.",
              status: 1,
            )));
      }
      log("Error msg: $errorMessage");
      // Get.showSnackbar(
      //   GetSnackBar(
      //     title: "Error",
      //     message: errorMessage,
      //   ),
      // );
    }
  }
}
