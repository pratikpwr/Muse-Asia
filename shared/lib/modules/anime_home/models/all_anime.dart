// To parse this JSON data, do
//
//     final allAnime = allAnimeFromJson(jsonString);

import 'dart:convert';

AllAnime allAnimeFromJson(String str) => AllAnime.fromJson(json.decode(str));

class AllAnime {
  AllAnime({
    this.message,
    this.statusCode,
    this.anime,
  });

  String message;
  int statusCode;
  List<AnimeShort> anime;

  factory AllAnime.fromJson(Map<String, dynamic> json) => AllAnime(
    message: json["message"],
    statusCode: json["statusCode"],
    anime: List<AnimeShort>.from(json["anime"].map((x) => AnimeShort.fromJson(x))),
  );
}

class AnimeShort {
  AnimeShort({
    this.id,
    this.title,
    this.imageUrl,
    this.rating,
  });

  String id;
  String title;
  String imageUrl;
  double rating;

  factory AnimeShort.fromJson(Map<String, dynamic> json) => AnimeShort(
    id: json["id"],
    title: json["title"],
    imageUrl: json["imageUrl"],
    rating: json["rating"].toDouble(),
  );
}
