import 'package:cardiovascular_predictor_ui/injection.dart';
import 'package:cardiovascular_predictor_ui/src/presentation/bloc/cardio_bloc.dart';
import 'package:cardiovascular_predictor_ui/src/presentation/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController systolicController = TextEditingController();
  final TextEditingController diastolicController = TextEditingController();
  // late Classifier _classifier;
  final _formKey = GlobalKey<FormState>();
  final cardioBloc = sl.get<CardioBloc>();

  String? inputValidator(String? input, String errorMessage) {
    if (input == null || input.isEmpty) {
      return errorMessage;
    }

    try {
      double.parse(input); // Try parsing the input as a number
    } catch (e) {
      return "Input is not a valid number";
    }

    return null; // Input is a valid number
  }

  @override
  void initState() {
    cardioBloc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: BlocListener<CardioBloc, CardioState>(
        bloc: cardioBloc,
        listener: (context, state) {
          if (state is CardioLoadedState) {
            Navigator.pushNamed(context, ResultScreen.routeName,
                arguments: state);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              SizedBox(
                height: screenHeight / 21,
              ),
              const Text(
                'Is Your Heart Healthy?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: screenHeight / 90,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: BlocBuilder<CardioBloc, CardioState>(
                  bloc: cardioBloc,
                  builder: (context, state) {
                    if (state is CardioLoadingState) {
                      return const SpinKitFadingCircle(
                        color: Colors.greenAccent,
                        size: 40.0,
                      );
                    }
                    return userForm();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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
            keyboardType: TextInputType.number,
            validator: (value) => inputValidator(value, 'Cannot be empty'),
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
            keyboardType: TextInputType.number,
            validator: (value) => inputValidator(value, 'Cannot be empty'),
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
            keyboardType: TextInputType.number,
            validator: (value) => inputValidator(value, 'Cannot be empty'),
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
            keyboardType: TextInputType.number,
            validator: (value) => inputValidator(value, 'Cannot be empty'),
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
            keyboardType: TextInputType.number,
            validator: (value) => inputValidator(value, 'Cannot be empty'),
            decoration: const InputDecoration(
                hintText: 'Diastolic Pressure (mmHg)',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          const SizedBox(height: 123),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                final height = num.parse(heightController.text);
                final weight = num.parse(weightController.text);
                final sysPressure = num.parse(systolicController.text);
                final age = num.parse(ageController.text);
                final diaPressure = num.parse(diastolicController.text);
                cardioBloc.add(PredictEvent(
                    age: age,
                    diaPressure: diaPressure,
                    height: height,
                    sysPressure: sysPressure,
                    weight: weight));
              }
            },
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Check',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
