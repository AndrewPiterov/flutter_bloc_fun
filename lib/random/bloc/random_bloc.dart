import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'random_event.dart';
part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  @override
  RandomState get initialState => RandomState(randomNumber: 77);

  @override
  Stream<RandomState> mapEventToState(
    RandomEvent event,
  ) async* {
    if (event is GenerateRandom) {
      final random = Random();
      final rv = random.nextInt(100);
      yield RandomState(randomNumber: rv);
    }
  }
}
