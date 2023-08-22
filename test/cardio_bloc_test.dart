import 'package:bloc_test/bloc_test.dart';
import 'package:cardiovascular_predictor_ui/src/presentation/bloc/cardio_bloc.dart';
import 'package:cardiovascular_predictor_ui/src/utils/mock_classifier_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CardioBloc Test', () {
    late CardioBloc cardioBloc;
    const modelFile = 'modelFile.tflite';
    const message = 'Your heart is healthy';
    const imgUrl = 'tr.png';

    setUp(() {
      EquatableConfig.stringify = true;
      final mockClf = MockClassifier(modelFile);
      cardioBloc = CardioBloc(mockClf);
    });
    blocTest(
        'emits [cardioLoading, cardioLoaded] state for successful prediction',
        build: () => cardioBloc,
        act: (bloc) => bloc.add(const PredictEvent(
            height: 189,
            weight: 89,
            sysPressure: 120,
            age: 23,
            diaPressure: 60)),
        expect: () => [
              CardioLoadingState(),
              const CardioLoadedState(message: message, image: imgUrl)
            ]);
  });
}
