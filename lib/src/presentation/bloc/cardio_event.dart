part of 'cardio_bloc.dart';

abstract class CardioEvent extends Equatable {
  const CardioEvent();
}

class CheckCardioVascolarEvent extends CardioEvent {
  final num height;
  final num weight;
  final num sysPressure;
  final num age;
  final num diaPressure;

  const CheckCardioVascolarEvent(
      {required this.height,
      required this.weight,
      required this.sysPressure,
      required this.age,
      required this.diaPressure});
  @override
  List<Object?> get props =>
      [height, weight, sysPressure, age, diaPressure];
}
