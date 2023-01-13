part of 'cardio_bloc.dart';

abstract class CardioState extends Equatable {
  const CardioState();

  @override
  List<Object> get props => [];
}

class CardioInitialState extends CardioState {
  @override
  List<Object> get props => [];
}

class CardioLoadingState extends CardioState {
  @override
  List<Object> get props => [];
}

class CardioLoadedState extends CardioState {
  final String message;
  final String image;

  const CardioLoadedState(
      {required this.message, required this.image});

  @override
  List<Object> get props => [message];
}

class ErrorState extends CardioState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [];
}
