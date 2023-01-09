import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/presentation/homescreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          fontFamily: 'Mulish'),
      home: const HomeScreen(),
    );
  }
}
