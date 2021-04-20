import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'anime_home_event.dart';
part 'anime_home_state.dart';

class AnimeHomeBloc extends Bloc<AnimeHomeEvent, AnimeHomeState> {
  AnimeHomeBloc() : super(AnimeHomeInitial());

  @override
  Stream<AnimeHomeState> mapEventToState(
    AnimeHomeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
