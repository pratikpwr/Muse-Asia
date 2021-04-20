import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'anime_details_event.dart';
part 'anime_details_state.dart';

class AnimeDetailsBloc extends Bloc<AnimeDetailsEvent, AnimeDetailsState> {
  AnimeDetailsBloc() : super(AnimeDetailsInitial());

  @override
  Stream<AnimeDetailsState> mapEventToState(
    AnimeDetailsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
