import 'package:cardiovascular_predictor_ui/src/presentation/bloc/cardio_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  //bloc
  sl.registerFactory(() => CardioBloc());
}
