// To parse this JSON data, do
//
//     final animeEpisodes = animeEpisodesFromJson(jsonString);

import 'dart:convert';

AnimeEpisodes animeEpisodesFromJson(String str) =>
    AnimeEpisodes.fromJson(json.decode(str));

class AnimeEpisodes {
  AnimeEpisodes({
    this.statusCode,
    this.message,
    this.episodes,
  });

  int statusCode;
  String message;
  List<EpisodeShort> episodes;

  factory AnimeEpisodes.fromJson(Map<String, dynamic> json) => AnimeEpisodes(
        statusCode: json["statusCode"],
        message: json["message"],
        episodes: List<EpisodeShort>.from(
            json["episodes"].map((x) => EpisodeShort.fromJson(x))),
      );
}

class EpisodeShort {
  EpisodeShort({
    this.id,
    this.title,
    this.imageUrl,
    this.episodeNo,
    this.subtitle,
  });

  String id;
  String title;
  String imageUrl;
  int episodeNo;
  bool subtitle;

  factory EpisodeShort.fromJson(Map<String, dynamic> json) => EpisodeShort(
        id: json["id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        episodeNo: int.parse(json["episodeNo"]),
        subtitle: json["subtitle"],
      );
}
