part of 'anime_home_bloc.dart';

abstract class AnimeHomeEvent extends Equatable {
  const AnimeHomeEvent();

  @override
  List<Object> get props => [];
}

class AnimeRequested extends AnimeHomeEvent {}
