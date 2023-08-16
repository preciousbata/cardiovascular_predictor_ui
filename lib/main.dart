import 'package:cardiovascular_predictor_ui/injection.dart' as di;
import 'package:cardiovascular_predictor_ui/routes.dart';
import 'package:cardiovascular_predictor_ui/src/presentation/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardiovascular Predictor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,
          useMaterial3: true,
          fontFamily: 'Mulish'),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
