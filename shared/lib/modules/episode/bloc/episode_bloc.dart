import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:shared/modules/episode/models/episode_details.dart';
import 'package:shared/modules/episode/repository/episode_repository.dart';

part 'episode_event.dart';

part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  EpisodeBloc() : super(EpisodeInitial());

  EpisodeRepository _episodeRepository = EpisodeRepository();

  @override
  Stream<EpisodeState> mapEventToState(
    EpisodeEvent event,
  ) async* {
    if (event is EpisodeRequested) {
      yield EpisodeLoading();
      try {
        final response =
            await _episodeRepository.getEpisode(episodeId: event.episodeId);

        if (response.statusCode != 200) {
          yield EpisodeLoadFailure(
              error: response.statusMessage, statusCode: response.statusCode);
        }
        final episodeDetails = EpisodeDetails.fromJson(response.data);
        yield EpisodeLoadSuccess(episode: episodeDetails.episode);
      } catch (err) {
        yield EpisodeLoadFailure(error: err.toString());
      }
    }
  }
}
