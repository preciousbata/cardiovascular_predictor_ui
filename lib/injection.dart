import 'package:cardiovascular_predictor_ui/src/domain/classifier.dart';
import 'package:cardiovascular_predictor_ui/src/presentation/bloc/cardio_bloc.dart';
import 'package:cardiovascular_predictor_ui/src/utils/classifier_impl.dart';
import 'package:cardiovascular_predictor_ui/src/utils/constants.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(() => CardioBloc(sl.get()));
  //core
  sl.registerFactory(() => Interpreter);
  sl.registerFactory<Classifier>(() => ClassifierImpl(clf_model));

  //logger
  sl.registerLazySingleton<Logger>(() => Logger());
}
