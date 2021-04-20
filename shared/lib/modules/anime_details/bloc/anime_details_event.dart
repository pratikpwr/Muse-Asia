part of 'anime_details_bloc.dart';

abstract class AnimeDetailsEvent extends Equatable {
  const AnimeDetailsEvent();
}

class AnimeRequested extends AnimeDetailsEvent {
  final String animeId;

  const AnimeRequested({@required this.animeId}) : assert(animeId != null);

  @override
  List<Object> get props => [animeId];
}
