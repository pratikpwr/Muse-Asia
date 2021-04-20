// To parse this JSON data, do
//
//     final playlist = playlistFromJson(jsonString);

import 'dart:convert';

Playlist playlistFromJson(String str) => Playlist.fromJson(json.decode(str));

String playlistToJson(Playlist data) => json.encode(data.toJson());

class Playlist {
  Playlist({
    this.nextPageToken,
    this.items,
    this.pageInfo,
  });

  String nextPageToken;
  List<Item> items;
  PageInfo pageInfo;

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        nextPageToken: json["nextPageToken"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "nextPageToken": nextPageToken,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "pageInfo": pageInfo.toJson(),
      };
}

class Item {
  Item({
    this.snippet,
    this.contentDetails,
  });

  Snippet snippet;
  ContentDetails contentDetails;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        snippet: Snippet.fromJson(json["snippet"]),
        contentDetails: ContentDetails.fromJson(json["contentDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "snippet": snippet.toJson(),
        "contentDetails": contentDetails.toJson(),
      };
}

class ContentDetails {
  ContentDetails({
    this.videoId,
    this.videoPublishedAt,
  });

  String videoId;
  DateTime videoPublishedAt;

  factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        videoId: json["videoId"],
        videoPublishedAt: DateTime.parse(json["videoPublishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "videoPublishedAt": videoPublishedAt.toIso8601String(),
      };
}

class Snippet {
  Snippet({
    this.title,
    this.description,
    this.thumbnails,
  });

  String title;
  String description;
  Thumbnails thumbnails;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
      };
}

class Thumbnails {
  Thumbnails({
    this.high,
  });

  High high;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        high: High.fromJson(json["high"]),
      );

  Map<String, dynamic> toJson() => {
        "high": high.toJson(),
      };
}

class High {
  High({
    this.url,
    this.width,
    this.height,
  });

  String url;
  int width;
  int height;

  factory High.fromJson(Map<String, dynamic> json) => High(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  // no of episodes
  int totalResults;
  int resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
      };
}

/*
{
  "nextPageToken": "CAEQAA",
  "items": [
    {
      "snippet": {
        "title": "The Price of Smiles - Episode 01 [English Sub]",
        "description": "For Official Anime Merchandise, please visit: https://www.hakkenonline.com/\nEnglish Full Episode Playlist: https://www.youtube.com/playlist?list=PLwLSw1_eDZl3h8JLBEqJkyCJyvKMrlPaQ\n简体中文字幕播放清单: https://www.youtube.com/playlist?list=PLwLSw1_eDZl1sEQ-v9s-qI3VEQaAgZxr2\n\nThe Price of Smiles\n笑容的代价\n===========\nEpisode 01 : The Girl From Soleil\nEpisode Summary : \nTwelve-year-old Princess Yuki is starting to take on the responsibilities of leading her kingdom. But when the borderland knights Yuni and Lune are rude to her, her retainer Joshua challenges them to a battle in a simulator.\n\n===========\nFree Anime Streaming Online on Muse Asia Channel!\nBe sure to subscribe to our channel so you won't miss the latest Anime!\n\nFor more information, connect with us on:\nWebsite: http://www.e-muse.com.sg \nInstagram: @musesg_\nYoutube: http://bit.ly/2YYA4rj\n\n#ThePriceofSmiles #エガオノダイカ #EgaonoDaika #Mecha #shonen #タツノコプロ #花守ゆみり #早見沙織 #松岡禎丞 #佐藤利奈 #神奈延年 #free #anime #museasia #musesg",
        "thumbnails": {
          "high": {
            "url": "https://i.ytimg.com/vi/cN_k0zWKRGg/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        }
      },
      "contentDetails": {
        "videoId": "cN_k0zWKRGg",
        "videoPublishedAt": "2021-03-01T12:00:13Z"
      }
    }
  ],
  "pageInfo": {
    "totalResults": 12,
    "resultsPerPage": 1
  }
}

 */
