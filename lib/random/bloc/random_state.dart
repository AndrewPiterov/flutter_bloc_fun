part of 'random_bloc.dart';

class RandomState extends Equatable {
  final int randomNumber;
  const RandomState({this.randomNumber});

  @override
  List<Object> get props => [randomNumber];
}
