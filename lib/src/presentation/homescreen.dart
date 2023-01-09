import 'package:cardiovascular_predictor_ui/src/utils/background.dart';
import 'package:cardiovascular_predictor_ui/src/utils/classifier.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController ageController;
  final TextEditingController systolicController;
  late TextEditingController diastolicController;
  late String value;
  late Classifier _classifier;

  @override
  void initState() {
    heightController = TextEditingController();
    weightController = TextEditingController();
    ageController = TextEditingController();
    systolicController = TextEditingController();
    diastolicController = TextEditingController();
    _classifier = Classifier();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title:
            const Text('Cardiovascular Disease Predictor'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(children: [
          const BackGroundImage(imageUrl: 'assets/bg2.jpg'),
          Container(
            margin: const EdgeInsets.only(
                top: 20, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
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
                    final height =
                        num.parse(heightController.text);
                    final weight =
                        num.parse(weightController.text);
                    final sysPressure =
                        num.parse(systolicController.text);
                    final age =
                        num.parse(ageController.text);
                    final diaPressure =
                        num.parse(diastolicController.text);

                    final prediction = _classifier.predict([
                      height,
                      weight,
                      sysPressure,
                      age,
                      diaPressure
                    ]);
                    debugPrint('$prediction');
                  },
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Predict',
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
          ),
        ]),
      ),
    );
  }
}
