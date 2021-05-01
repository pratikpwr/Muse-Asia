import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared/modules/anime_details/models/anime_episodes.dart';
import 'package:shared/modules/anime_home/models/all_anime.dart';
import 'package:shared/modules/anime_home/resources/anime_home_repository.dart';

part 'anime_home_event.dart';

part 'anime_home_state.dart';

class AnimeHomeBloc extends Bloc<AnimeHomeEvent, AnimeHomeState> {
  AnimeHomeBloc() : super(AnimeHomeInitial());

  AnimeHomeRepository _animeHomeRepository = AnimeHomeRepository();

  @override
  Stream<AnimeHomeState> mapEventToState(
    AnimeHomeEvent event,
  ) async* {
    if (event is AnimeRequested) {
      yield AnimeLoading();
      try {
        final Response response = await _animeHomeRepository.getAllAnime();

        if (response.statusCode != 200) {
          yield AnimeLoadFailure(
              statusCode: response.statusCode,
              error: response.statusMessage.toString());
        }

        final Response response2 = await _animeHomeRepository.getRecent();

        if (response2.statusCode != 200) {
          yield AnimeLoadFailure(
              statusCode: response2.statusCode,
              error: response2.statusMessage.toString());
        }

        AllAnime allAnime = AllAnime.fromJson(response.data);
        AnimeEpisodes recent = AnimeEpisodes.fromJson(response2.data);

        yield AnimeLoadSuccess(
            listOfAnime: allAnime.anime, recentEpisodes: recent.episodes);
      } catch (err) {
        yield AnimeLoadFailure(error: err.toString());
      }
    }
  }
}
