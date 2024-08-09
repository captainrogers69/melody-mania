import '../../domain/manager/dio_wrapper.dart';
import '../../domain/models/response/saavn/search_songs_response.dart';
import '../../domain/routes/saavn_routes.dart';

class SaavnService {
  SaavnService();

  static final SaavnRoutes _routes = SaavnRoutes.instance;
  static const String baseUrl = 'https://saavn.dev/api/';

  Future<SongsSearchResponse> searchSongwithQuery(
      {required String query}) async {
    SongsSearchResponse searchResponse = SongsSearchResponse();
    // Map<String, dynamic> requestBody = {};
    await DioWrapper.request(
      path: "$baseUrl/${_routes.searchwithQuery}?query=$query",
      params: {},
      // onResponse: (response, error) {
      //   // log("Response: ${response}");
      //   searchResponse = SongsSearchResponse.fromJson(response);
      // },
    );
    return searchResponse;
  }

  // songs/3IoDK8qI/lyrics

  // Future<SongsSearchResponse> fetchSongLyricswithSongId(
  //     {required String query}) async {
  //   // SongsSearchResponse searchResponse = SongsSearchResponse();
  //   // Map<String, dynamic> requestBody = {};
  //   await DioWrapper.request(
  //     path: "$baseUrl/${_routes.searchwithQuery}?query=$query",
  //     params: {},
  //     onResponse: (response, error) {
  //       log("Response: ${response.data}");
  //     },
  //   );
  //   return searchResponse;
  // }
}


/* 
<!-- Launch Url Starts -->
<key>LSApplicationQueriesSchemes</key>
  <array>
  <string>https</string>
    <string>sms</string>
    <string>tel</string>
  </array>
<!-- Launch Url Ends -->
<key>UIBackgroundModes</key>
  <array>
    <string>audio</string>
  </array>
<!-- Launch Url Ends -->
<!-- Just Audio Starts -->
<key>NSMicrophoneUsageDescription</key>
  <string>Please allow microphone to audio use</string>
<!-- Just Audio Ends -->
<!--  -->
<key>NSAppTransportSecurity</key>
  <dict>
  	<key>NSAllowsArbitraryLoads</key>
  	<true/>
  </dict>
<!--  -->
*/