part of 'episode_bloc.dart';

abstract class EpisodeEvent extends Equatable {
  const EpisodeEvent();

  @override
  List<Object> get props => [];
}

class EpisodeRequested extends EpisodeEvent {
  final String episodeId;

  EpisodeRequested({@required this.episodeId}) : assert(episodeId != null);

  @override
  List<Object> get props => [episodeId];
}
