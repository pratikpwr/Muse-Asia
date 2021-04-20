import 'package:api/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AnimeRepository {
  // get list of anime
  Future<Response> getAllPlaylists({String nextPlaylistsPageToken}) async {
    Response response = await ApiSdk.getAllPlaylists(
        nextPlaylistsPageToken: nextPlaylistsPageToken);
    return response;
  }

  // get episodes of an anime
  Future<Response> getVideosOfPlaylist(
      {@required String playlistId, String nextVideosPageToken}) async {
    Response response = await ApiSdk.getVideosOfPlaylist(
        playlistId: playlistId, nextVideosPageToken: nextVideosPageToken);
    return response;
  }
}
