part of 'episode_bloc.dart';

abstract class EpisodeState extends Equatable {
  const EpisodeState();

  @override
  List<Object> get props => [];
}

class EpisodeInitial extends EpisodeState {}

class EpisodeLoading extends EpisodeState {}

class EpisodeLoadSuccess extends EpisodeState {
  final Episode episode;

  EpisodeLoadSuccess({@required this.episode}) : assert(episode != null);

  @override
  List<Object> get props => [episode];
}

class EpisodeLoadFailure extends EpisodeState {
  final int statusCode;
  final String error;

  EpisodeLoadFailure({this.statusCode, this.error});

  @override
  List<Object> get props => [statusCode, error];
}
