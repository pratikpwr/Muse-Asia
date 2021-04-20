import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:shared/modules/anime_details/models/anime_details.dart';
import 'package:shared/modules/anime_details/models/anime_episodes.dart';
import 'package:shared/modules/anime_details/resources/anime_details_repository.dart';

part 'anime_details_event.dart';

part 'anime_details_state.dart';

class AnimeDetailsBloc extends Bloc<AnimeDetailsEvent, AnimeDetailsState> {
  AnimeDetailsBloc() : super(AnimeDetailsInitial());

  AnimeDetailsRepository _animeDetailsRepository = AnimeDetailsRepository();

  @override
  Stream<AnimeDetailsState> mapEventToState(
    AnimeDetailsEvent event,
  ) async* {
    if (event is AnimeRequested) {
      yield AnimeLoading();

      try {
        final Response response =
            await _animeDetailsRepository.getAnime(animeId: event.animeId);

        if (response.statusCode != 200) {
          yield AnimeLoadFailure(
              error: response.statusMessage.toString(),
              statusCode: response.statusCode);
        }

        final Response response2 = await _animeDetailsRepository
            .getAnimeEpisodes(animeId: event.animeId);

        if (response2.statusCode != 200) {
          yield AnimeLoadFailure(
              error: response2.statusMessage.toString(),
              statusCode: response2.statusCode);
        }

        AnimeDetails animeDetails = AnimeDetails.fromJson(response.data);
        AnimeEpisodes animeEpisodes = AnimeEpisodes.fromJson(response2.data);

        yield AnimeLoadSuccess(
            anime: animeDetails.anime, episodes: animeEpisodes.episodes);
      } catch (err) {
        yield AnimeLoadFailure(error: err.toString());
      }
    }
  }
}
