// To parse this JSON data, do
//
//     final animeDetails = animeDetailsFromJson(jsonString);

import 'dart:convert';

AnimeDetails animeDetailsFromJson(String str) =>
    AnimeDetails.fromJson(json.decode(str));

class AnimeDetails {
  AnimeDetails({
    this.message,
    this.statusCode,
    this.anime,
  });

  String message;
  int statusCode;
  Anime anime;

  factory AnimeDetails.fromJson(Map<String, dynamic> json) => AnimeDetails(
        message: json["message"],
        statusCode: json["statusCode"],
        anime: Anime.fromJson(json["anime"]),
      );
}

class Anime {
  Anime({
    this.episodes,
    this.japEpisodes,
    this.id,
    this.title,
    this.japTitle,
    this.description,
    this.imageUrl,
    this.rating,
    this.playlistId,
    this.japPlaylistId,
  });

  List<dynamic> episodes;
  List<dynamic> japEpisodes;
  String id;
  String title;
  String japTitle;
  String description;
  String imageUrl;
  double rating;
  String playlistId;
  String japPlaylistId;

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
        episodes: List<dynamic>.from(json["episodes"].map((x) => x)),
        japEpisodes: List<dynamic>.from(json["japEpisodes"].map((x) => x)),
        id: json["_id"],
        title: json["title"],
        japTitle: json["japTitle"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        rating: json["rating"].toDouble(),
        playlistId: json["playlistId"],
        japPlaylistId: json["japPlaylistId"],
      );
}
