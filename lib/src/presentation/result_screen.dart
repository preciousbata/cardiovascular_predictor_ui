import 'package:cardiovascular_predictor_ui/src/presentation/bloc/cardio_bloc.dart';
import 'package:cardiovascular_predictor_ui/src/presentation/homescreen.dart';
import 'package:cardiovascular_predictor_ui/src/widgets/option_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/result';
  final CardioLoadedState state;
  const ResultScreen({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
          bottom: screenHeight / 23,
          left: screenHeight / 34,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              OptionCard(
                text: 'Talk to a Doctor',
                imageUrl: 'assets/call_centre.json',
                onTap: null,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: OptionCard(
                  text: 'Get Fitness Tips',
                  imageUrl: 'assets/notify.json',
                  onTap: null,
                ),
              ),
            ],
          ),
        ),
        state.message == 'You need to take \ncare of your heart'
            ? Lottie.asset('assets/support.json',
                fit: BoxFit.contain, height: screenHeight)
            : Lottie.asset('assets/celebrate.json',
                fit: BoxFit.fill, height: screenHeight),
        Positioned(
          top: screenHeight / 14,
          child: Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen())),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 30,
                  ))
            ],
          ),
        ),
        Positioned(
          top: state.message == 'You need to take \ncare of your heart'
              ? screenHeight / 5.2
              : screenHeight / 2,
          left: screenWidth / 6,
          child: Text(
            state.message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
      ]),
    );
  }
}
