import 'package:bloc/bloc.dart';
import 'package:cardiovascular_predictor_ui/src/utils/classifier.dart';
import 'package:equatable/equatable.dart';

part 'cardio_event.dart';
part 'cardio_state.dart';

class CardioBloc extends Bloc<CardioEvent, CardioState> {
  final classifier = Classifier();

  CardioBloc() : super(CardioInitialState()) {
    on<CheckCardioVascolarEvent>((event, emit) {
      emit(CardioLoadingState());
      try {
        final prediction = classifier.predict([
          event.height,
          event.weight,
          event.sysPressure,
          event.age,
          event.diaPressure
        ]);
        if (prediction[0] < 0.5) {
          emit(const CardioLoadedState(
              message: 'Your heart is healthy',
              image: 'assets/correct.png'));
        } else {
          emit(const CardioLoadedState(
              image: 'assets/error.png',
              message: 'Your heart is at risk'));
        }
      } on Exception catch (e) {
        emit(ErrorState('$e'));
      }
    });
  }
}
