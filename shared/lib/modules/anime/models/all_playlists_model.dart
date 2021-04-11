// To parse this JSON data, do
//
//     final allPlaylists = allPlaylistsFromJson(jsonString);

import 'dart:convert';

// all anime on muse asia

AllPlaylists allPlaylistsFromJson(String str) =>
    AllPlaylists.fromJson(json.decode(str));

String allPlaylistsToJson(AllPlaylists data) => json.encode(data.toJson());

class AllPlaylists {
  AllPlaylists({
    this.nextPageToken,
    this.pageInfo,
    this.items,
  });

  String nextPageToken;
  PageInfo pageInfo;
  List<Item> items;

  factory AllPlaylists.fromJson(Map<String, dynamic> json) => AllPlaylists(
        nextPageToken: json["nextPageToken"],
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nextPageToken": nextPageToken,
        "pageInfo": pageInfo.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.snippet,
    this.contentDetails,
  });

  String id;
  Snippet snippet;
  ContentDetails contentDetails;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
        contentDetails: ContentDetails.fromJson(json["contentDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "snippet": snippet.toJson(),
        "contentDetails": contentDetails.toJson(),
      };
}

class ContentDetails {
  ContentDetails({
    this.itemCount,
  });

  int itemCount;

  factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        itemCount: json["itemCount"],
      );

  Map<String, dynamic> toJson() => {
        "itemCount": itemCount,
      };
}

class Snippet {
  Snippet({
    this.publishedAt,
    this.title,
    this.description,
    this.thumbnails,
  });

  DateTime publishedAt;
  String title;
  String description;
  Thumbnails thumbnails;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
      );

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt.toIso8601String(),
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
  "nextPageToken": "CAIQAA",
  "pageInfo": {
    "totalResults": 235,
    "resultsPerPage": 2
  },
  "items": [
    {
      "id": "PLwLSw1_eDZl0KbQlqHjTn5dWFSadUHkzh",
      "snippet": {
        "publishedAt": "2021-03-18T10:07:58Z",
        "title": "SEVEN KNIGHTS REVOLUTION -Hero Successor- [English Sub]",
        "description": "“Do what you want. ”\n\nThere were heroes who saved the world in the past. \nMany heroes fought the forces of “Destruction” and protected this world. \n\nThen, time goes by… \n\nThese heroes became history. \nThe boys and girls who inherited the power of these heroes are called \"Successors\".\nThey are now fighting for the world, the destiny of which is entrusted to them. \n\nOne of the Seven Knights, Faria, who is the top of successors,\nsaves a boy called Nemo while fighting against the invading army of “Destruction”.\n\nDuring the fierce battle, \nNemo awakens his power of “hero” and demonstrates his abilities as a “Successor” despite not realizing it. \n\nHowever, his “Hero”\nwas someone that nobody knows about or talks about. \n\nAnd that’s the moment when it starts. \nThe journey of soul, intertwining the past and the present…",
        "thumbnails": {

          "high": {
            "url": "https://i.ytimg.com/vi/r6E5l3v4vrU/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        }
      },
      "contentDetails": {
        "itemCount": 1
      }
    }
  ]
}

 */
