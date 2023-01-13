import 'package:cardiovascular_predictor_ui/src/presentation/bloc/cardio_bloc.dart';
import 'package:cardiovascular_predictor_ui/src/utils/background.dart';
import 'package:cardiovascular_predictor_ui/src/utils/classifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../injection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController heightController =
      TextEditingController();
  final TextEditingController weightController =
      TextEditingController();
  final TextEditingController ageController =
      TextEditingController();
  final TextEditingController systolicController =
      TextEditingController();
  final TextEditingController diastolicController =
      TextEditingController();
  late Classifier _classifier;
  final _formKey = GlobalKey<FormState>();
  final cardioBloc = sl.get<CardioBloc>();

  @override
  void initState() {
    _classifier = Classifier();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Check Your Heart'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        const BackGroundImage(imageUrl: 'assets/bg2.jpg'),
        Container(
          margin: const EdgeInsets.only(
              top: 20, left: 10, right: 10),
          child: BlocBuilder<CardioBloc, CardioState>(
            bloc: cardioBloc,
            builder: (context, state) {
              if (state is CardioLoadedState) {
                return ResultScreen(state: state);
              } else if (state is CardioLoadingState) {
                return const SpinKitFadingCircle(
                  color: Colors.greenAccent,
                  size: 40.0,
                );
              }
              return userForm();
            },
          ),
        ),
      ]),
    );
  }

  Widget buildResultScreen(CardioLoadedState state) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(state.image),
              width: 300,
            ),
            Text(
              state.message,
              style: const TextStyle(fontSize: 20),
            )
          ]),
    );
  }

  Widget userForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: heightController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a value";
              }
              return null;
            },
            decoration: const InputDecoration(
                hintText: 'Height (cm)',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: weightController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a value";
              }
              return null;
            },
            decoration: const InputDecoration(
                hintText: 'Weight (kg)',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: systolicController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a value";
              }
              return null;
            },
            decoration: const InputDecoration(
                hintText: 'Systolic Pressure (mmHg)',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: ageController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a value";
              }
              return null;
            },
            decoration: const InputDecoration(
                hintText: 'Age',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: diastolicController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a value";
              }
              return null;
            },
            decoration: const InputDecoration(
                hintText: 'Diastolic Pressure (mmHg)',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final height =
                    num.parse(heightController.text);
                final weight =
                    num.parse(weightController.text);
                final sysPressure =
                    num.parse(systolicController.text);
                final age = num.parse(ageController.text);
                final diaPressure =
                    num.parse(diastolicController.text);
                cardioBloc.add(Check(
                    age: age,
                    diaPressure: diaPressure,
                    height: height,
                    sysPressure: sysPressure,
                    weight: weight));
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Check',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final CardioLoadedState state;
  const ResultScreen({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () =>
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const HomeScreen())),
                  icon: const Icon(
                      Icons.arrow_back_ios_new_rounded))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Image(
            image: AssetImage(state.image),
            width: 300,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            state.message,
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600),
          )
        ]),
      ),
    );
  }
}
