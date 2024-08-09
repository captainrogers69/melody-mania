// To parse this JSON data, do
//
//     final songsSearchResponse = songsSearchResponseFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

SongsSearchResponse songsSearchResponseFromJson(String str) =>
    SongsSearchResponse.fromJson(json.decode(str));

String songsSearchResponseToJson(SongsSearchResponse data) =>
    json.encode(data.toJson());

class SongsSearchResponse {
  final bool? success;
  final Data? data;

  SongsSearchResponse({
    this.success,
    this.data,
  });

  factory SongsSearchResponse.fromJson(Map<String, dynamic> json) {
    // log("${json["data"].runtimeType} heyyyy");
    return SongsSearchResponse(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  final int? total;
  final int? start;
  final List<Result>? results;

  Data({
    this.total,
    this.start,
    this.results,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        start: json["start"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "start": start,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  final String? id;
  final String? name;
  final ResultType? type;
  final String? year;
  final dynamic releaseDate;
  final int? duration;
  final String? label;
  final bool? explicitContent;
  final int? playCount;
  final String? language;
  final bool? hasLyrics;
  final dynamic lyricsId;
  final String? url;
  final String? copyright;
  final Album? album;
  final Artists? artists;
  final List<DownloadUrl>? image;
  final List<DownloadUrl>? downloadUrl;

  Result({
    this.id,
    this.name,
    this.type,
    this.year,
    this.releaseDate,
    this.duration,
    this.label,
    this.explicitContent,
    this.playCount,
    this.language,
    this.hasLyrics,
    this.lyricsId,
    this.url,
    this.copyright,
    this.album,
    this.artists,
    this.image,
    this.downloadUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        type: resultTypeValues.map[json["type"]]!,
        year: json["year"],
        releaseDate: json["releaseDate"],
        duration: json["duration"],
        label: json["label"],
        explicitContent: json["explicitContent"],
        playCount: json["playCount"],
        language: json["language"],
        hasLyrics: json["hasLyrics"],
        lyricsId: json["lyricsId"],
        url: json["url"],
        copyright: json["copyright"],
        album: json["album"] == null ? null : Album.fromJson(json["album"]),
        artists:
            json["artists"] == null ? null : Artists.fromJson(json["artists"]),
        image: json["image"] == null
            ? []
            : List<DownloadUrl>.from(
                json["image"]!.map((x) => DownloadUrl.fromJson(x))),
        downloadUrl: json["downloadUrl"] == null
            ? []
            : List<DownloadUrl>.from(
                json["downloadUrl"]!.map((x) => DownloadUrl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": resultTypeValues.reverse[type],
        "year": year,
        "releaseDate": releaseDate,
        "duration": duration,
        "label": label,
        "explicitContent": explicitContent,
        "playCount": playCount,
        "language": language,
        "hasLyrics": hasLyrics,
        "lyricsId": lyricsId,
        "url": url,
        "copyright": copyright,
        "album": album?.toJson(),
        "artists": artists?.toJson(),
        "image": image == null
            ? []
            : List<dynamic>.from(image!.map((x) => x.toJson())),
        "downloadUrl": downloadUrl == null
            ? []
            : List<dynamic>.from(downloadUrl!.map((x) => x.toJson())),
      };
}

class Album {
  final String? id;
  final String? name;
  final String? url;

  Album({
    this.id,
    this.name,
    this.url,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}

class Artists {
  final List<All>? primary;
  final List<All>? featured;
  final List<All>? all;

  Artists({
    this.primary,
    this.featured,
    this.all,
  });

  factory Artists.fromJson(Map<String, dynamic> json) => Artists(
        primary: json["primary"] == null
            ? []
            : List<All>.from(json["primary"]!.map((x) => All.fromJson(x))),
        featured: json["featured"] == null
            ? []
            : List<All>.from(json["featured"]!.map((x) => All.fromJson(x))),
        all: json["all"] == null
            ? []
            : List<All>.from(json["all"]!.map((x) => All.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "primary": primary == null
            ? []
            : List<dynamic>.from(primary!.map((x) => x.toJson())),
        "featured": featured == null
            ? []
            : List<dynamic>.from(featured!.map((x) => x.toJson())),
        "all":
            all == null ? [] : List<dynamic>.from(all!.map((x) => x.toJson())),
      };
}

class All {
  final String? id;
  final String? name;
  final Role? role;
  final List<DownloadUrl>? image;
  final AllType? type;
  final String? url;

  All({
    this.id,
    this.name,
    this.role,
    this.image,
    this.type,
    this.url,
  });

  factory All.fromJson(Map<String, dynamic> json) => All(
        id: json["id"],
        name: json["name"],
        role: roleValues.map[json["role"]]!,
        image: json["image"] == null
            ? []
            : List<DownloadUrl>.from(
                json["image"]!.map((x) => DownloadUrl.fromJson(x))),
        type: allTypeValues.map[json["type"]]!,
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": roleValues.reverse[role],
        "image": image == null
            ? []
            : List<dynamic>.from(image!.map((x) => x.toJson())),
        "type": allTypeValues.reverse[type],
        "url": url,
      };
}

class DownloadUrl {
  final Quality? quality;
  final String? url;

  DownloadUrl({
    this.quality,
    this.url,
  });

  factory DownloadUrl.fromJson(Map<String, dynamic> json) => DownloadUrl(
        quality: qualityValues.map[json["quality"]]!,
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "quality": qualityValues.reverse[quality],
        "url": url,
      };
}

enum Quality {
  THE_12_KBPS,
  THE_150_X150,
  THE_160_KBPS,
  THE_320_KBPS,
  THE_48_KBPS,
  THE_500_X500,
  THE_50_X50,
  THE_96_KBPS
}

final qualityValues = EnumValues({
  "12kbps": Quality.THE_12_KBPS,
  "150x150": Quality.THE_150_X150,
  "160kbps": Quality.THE_160_KBPS,
  "320kbps": Quality.THE_320_KBPS,
  "48kbps": Quality.THE_48_KBPS,
  "500x500": Quality.THE_500_X500,
  "50x50": Quality.THE_50_X50,
  "96kbps": Quality.THE_96_KBPS
});

enum Role {
  FEATURED_ARTISTS,
  LYRICIST,
  MUSIC,
  PRIMARY_ARTISTS,
  SINGER,
  STARRING
}

final roleValues = EnumValues({
  "featured_artists": Role.FEATURED_ARTISTS,
  "lyricist": Role.LYRICIST,
  "music": Role.MUSIC,
  "primary_artists": Role.PRIMARY_ARTISTS,
  "singer": Role.SINGER,
  "starring": Role.STARRING
});

enum AllType { ARTIST }

final allTypeValues = EnumValues({"artist": AllType.ARTIST});

enum ResultType { SONG }

final resultTypeValues = EnumValues({"song": ResultType.SONG});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
