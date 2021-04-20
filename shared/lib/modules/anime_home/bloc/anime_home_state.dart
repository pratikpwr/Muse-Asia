part of 'anime_home_bloc.dart';

abstract class AnimeHomeState extends Equatable {
  const AnimeHomeState();

  @override
  List<Object> get props => [];
}

class AnimeHomeInitial extends AnimeHomeState {}

class AnimeLoading extends AnimeHomeState {}

class AnimeDataLoaded extends AnimeHomeState {
  final AllAnime allAnime;

  AnimeDataLoaded(this.allAnime) : assert(allAnime != null);

  @override
  List<Object> get props => [allAnime];
}

class AnimeLoadFailure extends AnimeHomeState {
  final int statusCode;
  final String error;

  AnimeLoadFailure({this.statusCode, this.error});

  @override
  List<Object> get props => [statusCode, error];
}
