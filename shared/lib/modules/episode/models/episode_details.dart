// To parse this JSON data, do
//
//     final episodeDetails = episodeDetailsFromJson(jsonString);

import 'dart:convert';

EpisodeDetails episodeDetailsFromJson(String str) =>
    EpisodeDetails.fromJson(json.decode(str));

class EpisodeDetails {
  EpisodeDetails({
    this.message,
    this.statusCode,
    this.episode,
  });

  String message;
  int statusCode;
  Episode episode;

  factory EpisodeDetails.fromJson(Map<String, dynamic> json) => EpisodeDetails(
        message: json["message"],
        statusCode: json["statusCode"],
        episode: Episode.fromJson(json["episode"]),
      );
}

class Episode {
  Episode({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.releaseDate,
    this.episodeNo,
    this.videoId,
    this.anime,
    this.sub,
  });

  String id;
  String title;
  String imageUrl;
  String description;
  DateTime releaseDate;
  int episodeNo;
  String videoId;
  String anime;
  bool sub;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json["_id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        releaseDate: DateTime.parse(json["releaseDate"]),
        episodeNo: int.parse(json["episodeNo"]),
        videoId: json["videoId"],
        anime: json["anime"],
        sub: json["sub"]
      );
}
