import 'package:api/main.dart';
import 'package:dio/dio.dart';

class AnimeHomeRepository {
  // get list of anime
  Future<Response> getAllAnime() async {
    Response response = await ApiSdk.getAllAnime();
    return response;
  }

  // get recent anime
  Future<Response> getRecent() async {
    Response response = await ApiSdk.getRecentEpisodes();
    return response;
  }
}
