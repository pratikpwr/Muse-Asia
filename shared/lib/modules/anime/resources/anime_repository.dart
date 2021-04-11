import 'package:api/main.dart';
import 'package:flutter/foundation.dart';

class AnimeRepository {
  // get list of anime
  Future<dynamic> getAllPlaylists({String nextPlaylistsPageToken}) async {
    final response = await ApiSdk.getAllPlaylists(
        nextPlaylistsPageToken: nextPlaylistsPageToken ?? '');
    return response;
  }

  // get episodes of an anime
  Future<dynamic> getVideosOfPlaylist(
      {@required String playlistId, String nextVideosPageToken}) async {
    final response = await ApiSdk.getVideosOfPlaylist(
        playlistId: playlistId, nextVideosPageToken: nextVideosPageToken ?? '');
    return response;
  }
}
