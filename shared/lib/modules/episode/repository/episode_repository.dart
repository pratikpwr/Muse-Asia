import 'package:api/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class EpisodeRepository {
  // get episode details
  Future<Response> getEpisode({@required String episodeId}) async {
    Response response = await ApiSdk.getEpisode(episodeId: episodeId);
    return response;
  }
}
