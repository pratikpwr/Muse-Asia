import 'package:api/rest/rest_api_handler_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api_constants.dart';

class ApiSdk {
  // sign up
  static Future<Response> signUp(
      {String userName, String email, String password}) async {
    String path = '${ApiConstants.serverUrl}/auth/signUp';

    Map<String, dynamic> body = {
      'name': userName,
      'email': email,
      'password': password
    };

    Response response = await RestApiHandlerData.postData(path, body);
    return response;
  }

  // sign in
  static Future<Response> signIn({String email, String password}) async {
    String path = '${ApiConstants.serverUrl}/auth/signIn';

    Map<String, dynamic> body = {'email': email, 'password': password};

    Response response = await RestApiHandlerData.putData(path, body);
    return response;
  }

  // get all anime
  static Future<Response> getAllAnime() async {
    String url = '${ApiConstants.serverUrl}/anime';
    Response response = await RestApiHandlerData.getData(url);
    return response;
  }

  // get anime details
  static Future<Response> getAnime({String animeId}) async {
    String url = '${ApiConstants.serverUrl}/anime/$animeId';
    Response response = await RestApiHandlerData.getData(url);
    return response;
  }

  // get anime episodes
  static Future<Response> getAnimeEpisodes({String animeId}) async {
    String url = '${ApiConstants.serverUrl}/anime/episodes/$animeId';
    Response response = await RestApiHandlerData.getData(url);
    return response;
  }

  // get episode details
  static Future<Response> getEpisode({String episodeId}) async {
    String url = '${ApiConstants.serverUrl}/episode/$episodeId';
    Response response = await RestApiHandlerData.getData(url);
    return response;
  }

  // get recent episodes
  static Future<Response> getRecentEpisodes() async {
    String url = '${ApiConstants.serverUrl}/episode/recent';
    Response response = await RestApiHandlerData.getData(url);
    return response;
  }

  // get add latest episodes
  static Future<Response> addLatestEpisodes() async {
    String url = '${ApiConstants.serverUrl}/episode/add-latest';
    Response response = await RestApiHandlerData.getData(url);
    return response;
  }

  // post anime
  static Future<Response> addAnime(
      {String title,
      String japTitle,
      String imageUrl,
      String description,
      double rating,
      String playlistId,
      String japPlaylistId}) async {
    String path = '${ApiConstants.serverUrl}/anime/add-anime';

    Map<String, dynamic> body = {
      "title": title,
      "japTitle": japTitle,
      "imageUrl": imageUrl,
      "description": description,
      "rating": rating,
      "playlistId": playlistId,
      "japPlaylistId": japPlaylistId
    };

    Response response = await RestApiHandlerData.postData(path, body);
    return response;
  }

  // Edit anime
  static Future<Response> editAnime(
      {String animeId,
      String title,
      String japTitle,
      String imageUrl,
      String description,
      double rating,
      String playlistId,
      String japPlaylistId}) async {
    String path = '${ApiConstants.serverUrl}/anime/$animeId';

    Map<String, dynamic> body = {
      "title": title,
      "japTitle": japTitle,
      "imageUrl": imageUrl,
      "description": description,
      "rating": rating,
      "playlistId": playlistId,
      "japPlaylistId": japPlaylistId
    };

    Response response = await RestApiHandlerData.putData(path, body);
    return response;
  }

  // delete anime
  static Future<Response> deleteAnime({String animeId}) async {
    String url = '${ApiConstants.serverUrl}/anime/$animeId';
    Response response = await RestApiHandlerData.deleteData(url);
    return response;
  }

  // get all anime playlists from muse asia channel
  static Future<Response> getAllPlaylists(
      {String nextPlaylistsPageToken}) async {
    var parameters = {
      "part": ["snippet,contentDetails"],
      "channelId": ApiConstants.museAsiaChannelId,
      "maxResults": '20',
      'pageToken': nextPlaylistsPageToken,
      'key': ApiConstants.youtubeApiKey,
    };

    String uri = Uri.https('${ApiConstants.googleApiBaseUrl}',
            '/youtube/v3/playlists', parameters)
        .toString();
    Response response = await RestApiHandlerData.getData(uri);
    return response;
  }

  // get all episodes of anime from playlist
  static Future<Response> getVideosOfPlaylist(
      {@required String playlistId, String nextVideosPageToken}) async {
    var parameters = {
      "part": ["snippet,contentDetails"],
      "playlistId": playlistId,
      "maxResults": '20',
      'pageToken': nextVideosPageToken,
      'key': ApiConstants.youtubeApiKey,
    };

    String uri = Uri.https('${ApiConstants.googleApiBaseUrl}',
            '/youtube/v3/playlistItems', parameters)
        .toString();

    Response response = await RestApiHandlerData.getData(uri);
    return response;
  }
}
