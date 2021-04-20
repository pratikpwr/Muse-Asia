part of 'episode_bloc.dart';

abstract class EpisodeState extends Equatable {
  const EpisodeState();
}

class EpisodeInitial extends EpisodeState {
  @override
  List<Object> get props => [];
}
