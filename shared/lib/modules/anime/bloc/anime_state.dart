part of 'anime_bloc.dart';

abstract class AnimeState extends Equatable {
  const AnimeState();
}

class AnimeInitial extends AnimeState {
  @override
  List<Object> get props => [];
}
