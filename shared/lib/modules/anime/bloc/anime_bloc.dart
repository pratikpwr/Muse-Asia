import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  AnimeBloc() : super(AnimeInitial());

  @override
  Stream<AnimeState> mapEventToState(
    AnimeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
