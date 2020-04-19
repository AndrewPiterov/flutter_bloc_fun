part of 'random_bloc.dart';

abstract class RandomEvent extends Equatable {
  const RandomEvent();
}

class GenerateRandom extends RandomEvent {
  @override
  List<Object> get props => [];
}
