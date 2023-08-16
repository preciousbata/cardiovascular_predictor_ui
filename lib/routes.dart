import 'package:cardiovascular_predictor_ui/src/presentation/bloc/cardio_bloc.dart';
import 'package:cardiovascular_predictor_ui/src/presentation/homescreen.dart';
import 'package:cardiovascular_predictor_ui/src/presentation/result_screen.dart';
import 'package:cardiovascular_predictor_ui/src/presentation/splashscreen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ResultScreen.routeName: (context) => ResultScreen(
      state: ModalRoute.of(context)!.settings.arguments as CardioLoadedState)
};
