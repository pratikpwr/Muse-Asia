part of 'anime_home_bloc.dart';

abstract class AnimeHomeState extends Equatable {
  const AnimeHomeState();

  @override
  List<Object> get props => [];
}

class AnimeHomeInitial extends AnimeHomeState {}

class AnimeLoading extends AnimeHomeState {}

class AnimeLoadSuccess extends AnimeHomeState {
  final List<AnimeShort> listOfAnime;
  final List<EpisodeShort> recentEpisodes;

  AnimeLoadSuccess({this.listOfAnime, this.recentEpisodes})
      : assert(listOfAnime != null);

  @override
  List<Object> get props => [listOfAnime, recentEpisodes];
}

class AnimeLoadFailure extends AnimeHomeState {
  final int statusCode;
  final String error;

  AnimeLoadFailure({this.statusCode, this.error});

  @override
  List<Object> get props => [statusCode, error];
}
