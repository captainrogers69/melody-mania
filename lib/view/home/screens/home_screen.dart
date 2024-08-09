import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:songbird/components/k_fetching.dart';
import 'package:songbird/utils/constants/k_colors.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../../utils/constants/k_routes.dart';
import '../provider/home_provider.dart';

class HomeScreen extends HookConsumerWidget {
  static const String id = KRoutes.homeScreen;
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* final state = ref.watch(homeProvider).categoryState;
    useEffect(() {
      ref.read(homeProvider).fetchCategories();
      return null;
    }, []); */
    return Scaffold(
      // backgroundColor: KColors.whiteColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: kToolbarHeight,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Songbird",
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
          ),
          // SliverToBoxAdapter(child: ,),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ref.watch(categoryFutureProvider).when(
                  data: (data) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final category = data[index];
                        return ListTile(
                          onTap: () {},
                          leading: Text("${index + 1}."),
                          title: Text(category.name.toString()),
                          subtitle: Text(category.slug.toString()),
                          trailing: CircleAvatar(
                            backgroundColor: KColors.grey300,
                            radius: 7,
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) {
                    return Text(
                      error.toString(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: KColors.whiteColor,
                          ),
                    );
                  },
                  loading: () {
                    return const EventButtonFetching(
                      color: KColors.whiteColor,
                    );
                  },
                ),
              ],
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     childCount:
          //         (state categories?.categories ?? []).length,
          //     (context, index) {
          //       CategoryItem category =
          //           (ref.watch(homeProvider).categories?.categories ??
          //               [])[index];
          //       return ListTile(
          //         onTap: () {},
          //         leading: Text("${index + 1}."),
          //         title: Text(category.name.toString()),
          //         subtitle: Text(category.slug.toString()),
          //         trailing: CircleAvatar(
          //           backgroundColor: KColors.grey300,
          //           radius: 7,
          //           child: CircleAvatar(
          //             radius: 5,
          //             backgroundColor:
          //                 Theme.of(context).scaffoldBackgroundColor,
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
/* 
class ContWi extends StatelessWidget {
  final Color? color;
  const ContWi({this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? KColors.errorColor,
      width: 100.w,
      height: 35.h,
    );
  }
} */

class HomeProvider with ChangeNotifier {
  final Ref _ref;
  HomeProvider(this._ref);

  static const String searchAuthority = 'www.youtube.com';
  static const Map paths = {
    'search': '/results',
    'channel': '/channel',
    'music': '/music',
    'playlist': '/playlist'
  };

  Future<Map<String, List>> getMusicHome() async {
    final Uri link = Uri.https(
      searchAuthority,
      paths['music'].toString(),
    );
    try {
      final Response response = await get(link);
      if (response.statusCode != 200) {
        return {};
      }
      final String searchResults =
          RegExp(r'(\"contents\":{.*?}),\"metadata\"', dotAll: true)
              .firstMatch(response.body)![1]!;
      final Map data = json.decode('{$searchResults}') as Map;

      final List result = data['contents']['twoColumnBrowseResultsRenderer']
              ['tabs'][0]['tabRenderer']['content']['sectionListRenderer']
          ['contents'] as List;

      final List headResult = data['header']['carouselHeaderRenderer']
          ['contents'][0]['carouselItemRenderer']['carouselItems'] as List;

      final List shelfRenderer = result.map((element) {
        return element['itemSectionRenderer']['contents'][0]['shelfRenderer'];
      }).toList();

      final List finalResult = shelfRenderer.map((element) {
        if (element['title']['runs'][0]['text'].trim() !=
            'Highlights from Global Citizen Live') {
          return {
            'title': element['title']['runs'][0]['text'],
            'playlists': element['title']['runs'][0]['text'].trim() == 'Charts'
                ? formatChartItems(
                    element['content']['horizontalListRenderer']['items']
                        as List,
                  )
                : element['title']['runs'][0]['text']
                        .toString()
                        .contains('Music Videos')
                    ? formatVideoItems(
                        element['content']['horizontalListRenderer']['items']
                            as List,
                      )
                    : formatItems(
                        element['content']['horizontalListRenderer']['items']
                            as List,
                      ),
          };
        } else {
          return null;
        }
      }).toList();

      final List finalHeadResult = formatHeadItems(headResult);
      finalResult.removeWhere((element) => element == null);
      log(finalResult.toString());
      return {'body': finalResult, 'head': finalHeadResult};
    } catch (e) {
      log("empty result".toString());
      return {};
    }
  }

  Future<void> getDownloadUrl() async {
    var youtube = YoutubeExplode();
    // var video = await youtube.videos.get(videoId);
    // List<String>
    VideoSearchList music = await youtube.search.search('safarnama');
    final StreamManifest manifest =
        await youtube.videos.streamsClient.getManifest(music.first.id);
    final List<AudioOnlyStreamInfo> sortedStreamInfo =
        manifest.audioOnly.sortByBitrate();
    log(sortedStreamInfo.first.url.toString());

    // var streamManifest =
    //     await youtube.videos.streamsClient.getManifest(videoId);
    // var audioOnlyStreams = streamManifest.audioOnly;
    // var audioStream = audioOnlyStreams.withHighestBitrate();
    // return audioStream.url.toString();
  }

  // final String _categoriesUrl =
  //     "https://allevents.in/api/index.php/mobile_apps/v2/get_all_categories_and_interests";

  // CategoryState _categoryState = CategoryState.fetching();
  // CategoryState? get categoryState => _categoryState;

  // Future<void> fetchCategories() async {
  //   _categoryState = CategoryState.fetching();
  //   await DioWrapper.request(
  //     path: _categoriesUrl,
  //     // onResponse: (response, error) {
  //     //   if (error.error?.status == 0) {
  //     //     final resp = CategoryResponse.fromJson(response);
  //     //     _categoryState = CategoryState.categories(resp.categories ?? []);
  //     //   } else {
  //     //     _categoryState = CategoryState.error(error.error!);
  //     //   }
  //     // },
  //     params: {},
  //   );
  // }
}

List formatChartItems(List itemsList) {
  try {
    final List result = itemsList.map((e) {
      return {
        'title': e['gridPlaylistRenderer']['title']['runs'][0]['text'],
        'type': 'chart',
        'description': e['gridPlaylistRenderer']['shortBylineText']['runs'][0]
            ['text'],
        'count': e['gridPlaylistRenderer']['videoCountText']['runs'][0]['text'],
        'playlistId': e['gridPlaylistRenderer']['navigationEndpoint']
            ['watchEndpoint']['playlistId'],
        'firstItemId': e['gridPlaylistRenderer']['navigationEndpoint']
            ['watchEndpoint']['videoId'],
        'image': e['gridPlaylistRenderer']['thumbnail']['thumbnails'][0]['url'],
        'imageMedium': e['gridPlaylistRenderer']['thumbnail']['thumbnails'][0]
            ['url'],
        'imageStandard': e['gridPlaylistRenderer']['thumbnail']['thumbnails'][0]
            ['url'],
        'imageMax': e['gridPlaylistRenderer']['thumbnail']['thumbnails'][0]
            ['url'],
      };
    }).toList();

    return result;
  } catch (e) {
    return List.empty();
  }
}

List formatItems(List itemsList) {
  try {
    final List result = itemsList.map((e) {
      return {
        'title': e['compactStationRenderer']['title']['simpleText'],
        'type': 'playlist',
        'description': e['compactStationRenderer']['description']['simpleText'],
        'count': e['compactStationRenderer']['videoCountText']['runs'][0]
            ['text'],
        'playlistId': e['compactStationRenderer']['navigationEndpoint']
            ['watchEndpoint']['playlistId'],
        'firstItemId': e['compactStationRenderer']['navigationEndpoint']
            ['watchEndpoint']['videoId'],
        'image': e['compactStationRenderer']['thumbnail']['thumbnails'][0]
            ['url'],
        'imageMedium': e['compactStationRenderer']['thumbnail']['thumbnails'][0]
            ['url'],
        'imageStandard': e['compactStationRenderer']['thumbnail']['thumbnails']
            [1]['url'],
        'imageMax': e['compactStationRenderer']['thumbnail']['thumbnails'][2]
            ['url'],
      };
    }).toList();

    return result;
  } catch (e) {
    return List.empty();
  }
}

List formatHeadItems(List itemsList) {
  try {
    final List result = itemsList.map((e) {
      return {
        'title': e['defaultPromoPanelRenderer']['title']['runs'][0]['text'],
        'type': 'video',
        'description':
            (e['defaultPromoPanelRenderer']['description']['runs'] as List)
                .map((e) => e['text'])
                .toList()
                .join(),
        'videoId': e['defaultPromoPanelRenderer']['navigationEndpoint']
            ['watchEndpoint']['videoId'],
        'firstItemId': e['defaultPromoPanelRenderer']['navigationEndpoint']
            ['watchEndpoint']['videoId'],
        'image': e['defaultPromoPanelRenderer']
                        ['largeFormFactorBackgroundThumbnail']
                    ['thumbnailLandscapePortraitRenderer']['landscape']
                ['thumbnails']
            .last['url'],
        'imageMedium': e['defaultPromoPanelRenderer']
                    ['largeFormFactorBackgroundThumbnail']
                ['thumbnailLandscapePortraitRenderer']['landscape']
            ['thumbnails'][1]['url'],
        'imageStandard': e['defaultPromoPanelRenderer']
                    ['largeFormFactorBackgroundThumbnail']
                ['thumbnailLandscapePortraitRenderer']['landscape']
            ['thumbnails'][2]['url'],
        'imageMax': e['defaultPromoPanelRenderer']
                        ['largeFormFactorBackgroundThumbnail']
                    ['thumbnailLandscapePortraitRenderer']['landscape']
                ['thumbnails']
            .last['url'],
      };
    }).toList();

    return result;
  } catch (e) {
    return List.empty();
  }
}

Future<Map?> formatVideo({
  required Video video,
  required String quality,
  // bool preferM4a = true,
}) async {
  if (video.duration?.inSeconds == null) return null;
  final List urls = await getUri(video);
  return {
    'id': video.id.value,
    'album': video.author,
    'duration': video.duration?.inSeconds.toString(),
    'title': video.title,
    'artist': video.author,
    'image': video.thumbnails.maxResUrl,
    'secondImage': video.thumbnails.highResUrl,
    'language': 'YouTube',
    'genre': 'YouTube',
    'url': quality == 'High' ? urls.last : urls.first,
    'lowUrl': urls.first,
    'highUrl': urls.last,
    'year': video.uploadDate?.year.toString(),
    '320kbps': 'false',
    'has_lyrics': 'false',
    'release_date': video.publishDate.toString(),
    'album_id': video.channelId.value,
    'subtitle': video.author,
    'perma_url': video.url,
  };
}

Future<List<String>> getUri(
  Video video,
  // {bool preferM4a = true}
) async {
  final StreamManifest manifest =
      await YoutubeExplode().videos.streamsClient.getManifest(video.id);
  final List<AudioOnlyStreamInfo> sortedStreamInfo =
      manifest.audioOnly.sortByBitrate();
  // if (preferM4a) {
  //   final List<AudioOnlyStreamInfo> temp = sortedStreamInfo
  //       .where((element) => element.audioCodec == 'mp4')
  //       .toList();

  //   if (temp.isNotEmpty) {
  //     if (quality == 'High') {
  //       final AudioOnlyStreamInfo streamInfo = temp.last;
  //       return streamInfo.url.toString();
  //     } else {
  //       final AudioOnlyStreamInfo streamInfo = temp.first;
  //       return streamInfo.url.toString();
  //     }
  //   }
  // }
  return [
    sortedStreamInfo.first.url.toString(),
    sortedStreamInfo.last.url.toString(),
  ];
}

List formatVideoItems(List itemsList) {
  try {
    final List result = itemsList.map((e) {
      return {
        'title': e['gridVideoRenderer']['title']['simpleText'],
        'type': 'video',
        'description': e['gridVideoRenderer']['shortBylineText']['runs'][0]
            ['text'],
        'count': e['gridVideoRenderer']['shortViewCountText']['simpleText'],
        'videoId': e['gridVideoRenderer']['videoId'],
        'firstItemId': e['gridVideoRenderer']['videoId'],
        'image': e['gridVideoRenderer']['thumbnail']['thumbnails'].last['url'],
        'imageMin': e['gridVideoRenderer']['thumbnail']['thumbnails'][0]['url'],
        'imageMedium': e['gridVideoRenderer']['thumbnail']['thumbnails'][1]
            ['url'],
        'imageStandard': e['gridVideoRenderer']['thumbnail']['thumbnails'][2]
            ['url'],
        'imageMax':
            e['gridVideoRenderer']['thumbnail']['thumbnails'].last['url'],
      };
    }).toList();

    return result;
  } catch (e) {
    return List.empty();
  }
}
