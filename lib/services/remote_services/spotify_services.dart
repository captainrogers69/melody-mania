// import 'dart:convert';
// import 'dart:developer';

// import '../../domain/manager/dio_wrapper.dart';
// import '../../domain/models/response/browse_category_resp.dart';
// import '../../domain/routes/spotify_routes.dart';

// class SpotifyService {
//   SpotifyService();

//   static final SpotifyRoutes _routes = SpotifyRoutes.instance;

//   static const List<String> _scopes = [
//     'user-read-private',
//     'user-read-email',
//     'playlist-read-private',
//     'playlist-read-collaborative',
//   ];
//   static const String baseUrl = 'https://api.spotify.com';
//   static const String clientSecret = 'f2a3e01a0f4f433b93bf706f0378e55d';
//   static const String clientId = 'c6fb9a4c3c574a8c9de6739c4d57e8ca';
//   static const String redirectUrl = 'app://songbird/auth';
//   final String baseTokenUrl = 'https://accounts.spotify.com/api/token';

//   static const String accessToken =
//       "BQCLFZNLQ62tHf-3y73KRiD8xxsHPfk4-EPRfssLSNDejHxUwV6cdT0_C-wicnsePSCZXBgubZDNtnQjIgMVXvybNsFgttWPPcMo8_95hbPuova3WXQzestLeCtyNLfcK194LxcOGoc9DriSwets5--mZeMBYPtya7CfFtO_e1i3Fz2ouQVPjXPh77LlMHds-fL27uXVBK3YzET5v2yXRw";
//   String requestAuthorization() =>
//       'https://accounts.spotify.com/authorize?client_id=$clientId&response_type=code&redirect_uri=$redirectUrl&scope=${_scopes.join('%20')}';

//   /* Future<void> refreshToken() async {
//     await DioWrapper.request(
//       path: "https://accounts.spotify.com/api/token",
//       headers: {
//         "Content-Type": "application/x-www-form-urlencoded",
//         "Authorization":
//             "Basic YzZmYjlhNGMzYzU3NGE4YzlkZTY3MzljNGQ1N2U4Y2E6ZjJhM2UwMWEwZjRmNDMzYjkzYmY3MDZmMDM3OGU1NWQ=",
//       },
//       params: {
//         "grant_type": "refresh_token",
//         "refresh_token": accessToken,
//         "client_id": clientId
//       },
//       onResponse: (response, error) async {
//         log("Response: $response ::\nError: ${error.toJson()}");
//       },
//     );
//   } */

//   Future<void> refreshToken(String code) async {
//     final Map<String, String> body = {
//       'grant_type': 'authorization_code',
//       'code': code,
//       'redirect_uri': redirectUrl,
//     };
//     try {
//       await DioWrapper.request(
//         path: baseTokenUrl,
//         headers: {
//           "Content-Type": "application/x-www-form-urlencoded",
//           "Authorization":
//               "Basic ${base64.encode(utf8.encode("$clientId:$clientSecret"))}",
//         },
//         params: body,
//         /* {
//           "grant_type": "refresh_token",
//           "refresh_token": accessToken,
//           "client_id": clientId
//         }, */
//         onResponse: (response, error) async {
//           log("Response: $response ::\nError: ${error.toJson()}");
//           if (response.statusCode == 200) {
//             final Map result = jsonDecode(response.body) as Map;
//             log("${result['access_token']}\n${result['refresh_token']}");
//             // return <String>[
//             //   result['access_token'].toString(),
//             //   result['refresh_token'].toString(),
//             // ];
//           }
//         },
//       );
//     } catch (e) {
//       log('Try Catch Error: $e');
//     }
//   }

//   Future<BrowseCategoriesResponse> fetchCategoriesList() async {
//     BrowseCategoriesResponse categories = BrowseCategoriesResponse();
//     await DioWrapper.request(
//       path: "$baseUrl/${_routes.categories}",
//       headers: {
//         "Authorization": "Bearer $accessToken",
//       },
//       params: {},
//       onResponse: (response, error) async {
//         if (error.error?.status == 1) {
//           final BrowseCategoriesResponse cate = BrowseCategoriesResponse(
//               errorMessage: error.error?.message,
//               errorCode: error.error?.status);
//           log("Error Browse Categories: ${error.error?.status} :-> ${error.error?.message}");
//           categories = cate;
//         } else {
//           final BrowseCategoriesResponse cate =
//               BrowseCategoriesResponse.fromJson(response);
//           log("Response Browse Categories: ${cate.categories?.toJson()}");
//           categories = cate;
//         }
//       },
//     );
//     return categories;
//   }
// }
