import 'package:api/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AnimeDetailsRepository {
  // get anime details
  Future<Response> getAnime({@required String animeId}) async {
    Response response = await ApiSdk.getAnime(animeId: animeId);
    return response;
  }

  // get anime episodes
  Future<Response> getAnimeEpisodes({@required String animeId}) async {
    Response response = await ApiSdk.getAnimeEpisodes(animeId: animeId);
    return response;
  }
}
