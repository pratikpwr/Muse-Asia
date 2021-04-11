import 'package:api/rest/rest_api_handler_data.dart';
import 'package:flutter/material.dart';
import 'api_constants.dart';

class ApiSdk {
  // get all anime playlists from muse asia channel
  static getAllPlaylists({String nextPlaylistsPageToken}) async {
    String url = '${ApiConstants.youtubeBaseUrl}/playlists';
    var parameters = {
      "part": ["snippet,contentDetails"],
      "channelId": ApiConstants.museAsiaChannelId,
      "maxResults": 20,
      'pageToken': nextPlaylistsPageToken ?? '',
      'key': ApiConstants.youtubeApiKey,
    };

    final response =
        await RestApiHandlerData.getData(url, parameters: parameters);
    return response;
  }

  // get all episodes of anime from playlist
  static getVideosOfPlaylist(
      {@required String playlistId, String nextVideosPageToken}) async {
    String url = '${ApiConstants.youtubeBaseUrl}/playlistItems';
    var parameters = {
      "part": ["snippet,contentDetails"],
      "playlistId": playlistId,
      "maxResults": 20,
      'pageToken': nextVideosPageToken ?? '',
      'key': ApiConstants.youtubeApiKey,
    };

    final response =
        await RestApiHandlerData.getData(url, parameters: parameters);
    return response;
  }
}
