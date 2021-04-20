part of 'anime_details_bloc.dart';

abstract class AnimeDetailsState extends Equatable {
  const AnimeDetailsState();

  @override
  List<Object> get props => [];
}

class AnimeDetailsInitial extends AnimeDetailsState {}

class AnimeLoading extends AnimeDetailsState {}

class AnimeLoadSuccess extends AnimeDetailsState {
  final Anime anime;
  final List<EpisodeShort> episodes;

  AnimeLoadSuccess({@required this.anime, @required this.episodes})
      : assert(anime != null);

  @override
  List<Object> get props => [anime];
}

class AnimeLoadFailure extends AnimeDetailsState {
  final int statusCode;
  final String error;

  AnimeLoadFailure({this.error, this.statusCode});

  @override
  List<Object> get props => [statusCode, error];
}
