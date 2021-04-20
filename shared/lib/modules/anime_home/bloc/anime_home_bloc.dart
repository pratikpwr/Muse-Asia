import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
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

        AllAnime allAnime = AllAnime.fromJson(response.data);
        yield AnimeDataLoaded(allAnime);
      } catch (err) {
        yield AnimeLoadFailure(error: err.toString());
      }
    }
  }
}
