import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

import 'dio_error.dart';
import 'dio_factory.dart';
import 'dio_methods.dart';

class DioWrapper {
  static Future<(dynamic, DioErrorResponse)> request(
      {required Map<String, dynamic> params,
      bool hideLoadingIndicator = false,
      DioMethod method = DioMethod.getr,
      // required OnDioResponse onResponse,
      Map<String, dynamic>? headers,
      CancelToken? cancelToken,
      required String path}) async {
    Map<String, dynamic> dioHeaders = headers ?? {};
    dioHeaders[HttpHeaders.contentTypeHeader] = "application/json";

    try {
      dio.Response response;
      switch (method) {
        case DioMethod.post:
          response = await DioFactory.dio!.post(
            path,
            cancelToken: cancelToken,
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
            cancelToken: cancelToken,
            options: Options(
              headers: dioHeaders,
            ),
          );
          break;
        case DioMethod.getr:
          response = await DioFactory.dio!.get(
            path,
            queryParameters: params,
            cancelToken: cancelToken,
            options: Options(
              headers: dioHeaders,
            ),
          );
          break;
        case DioMethod.patch:
          response = await DioFactory.dio!.patch(
            path,
            data: params,
            cancelToken: cancelToken,
            options: Options(
              headers: dioHeaders,
            ),
          );
          break;
        case DioMethod.put:
          response = await DioFactory.dio!.put(
            path,
            data: params,
            cancelToken: cancelToken,
            options: Options(
              headers: headers,
            ),
          );
          break;
        default:
          response = await DioFactory.dio!.post(
            path,
            cancelToken: cancelToken,
            options: Options(
              headers: dioHeaders,
            ),
            data: params,
          );
          break;
      }

      // onResponse(
      //   response.data,
      //   DioErrorResponse(
      //     error: ErrorResponse(
      //       message: "",
      //       status: 0,
      //     ),
      //   ),
      // );
      return (
        response.data,
        DioErrorResponse(
          error: ErrorResponse(
            message: "",
            status: 0,
          ),
        )
      );
    } catch (e) {
      log('Error message : $e');
      // String errorMessage = "";

      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.unknown) {
          // onResponse(
          //   null,
          //   DioErrorResponse(
          //     error: ErrorResponse(
          //       message: "Server unreachable",
          //       status: 1,
          //     ),
          //   ),
          // );
          return (
            null,
            DioErrorResponse(
              error: ErrorResponse(
                message: "Server unreachable",
                status: 1,
              ),
            ),
          );
        } else if (e.type == DioExceptionType.badResponse) {
          if (e.response!.statusCode == 401) {
            // onResponse(
            //   null,
            //   DioErrorResponse(
            //     error: ErrorResponse(
            //       message: e.response!.data['error']['message'].toString(),
            //       status: 1,
            //     ),
            //   ),
            // );
            return (
              null,
              DioErrorResponse(
                error: ErrorResponse(
                  message: e.response!.data['error']['message'].toString(),
                  status: 1,
                ),
              ),
            );
          } else {
            // onResponse(
            //   null,
            //   DioErrorResponse(
            //     error: ErrorResponse(
            //       message: e.response!.data['message'],
            //       status: 1,
            //     ),
            //   ),
            // );
            return (
              null,
              DioErrorResponse(
                error: ErrorResponse(
                  message: e.response!.data['message'],
                  status: 1,
                ),
              ),
            );
          }
        } else {
          // onResponse(
          //   null,
          //   DioErrorResponse(
          //     error: ErrorResponse(
          //       message: "Request cancelled",
          //       status: 1,
          //     ),
          //   ),
          // );
          return (
            null,
            DioErrorResponse(
              error: ErrorResponse(
                message: "Request cancelled",
                status: 1,
              ),
            ),
          );
        }
      } else {
        // onResponse(
        //   null,
        //   DioErrorResponse(
        //     error: ErrorResponse(
        //       message: "Something went wrong! Please try again.",
        //       status: 1,
        //     ),
        //   ),
        // );
        return (
          null,
          DioErrorResponse(
            error: ErrorResponse(
              message: "Something went wrong! Please try again.",
              status: 1,
            ),
          ),
        );
      }
      // log("Error msg: $errorMessage");
      // Get.showSnackbar(
      //   GetSnackBar(
      //     title: "Error",
      //     message: errorMessage,
      //   ),
      // );
    }
    // return (onResponse());
  }
}
