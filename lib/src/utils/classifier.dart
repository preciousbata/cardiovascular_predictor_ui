import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  // name of the model file
  final _modelFile = 'clf_model.tflite';

  // TensorFlow Lite Interpreter object
  late Interpreter _interpreter;

  Classifier() {
    // Load model when the classifier is initialized.
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      _interpreter =
          await Interpreter.fromAsset(_modelFile);
      debugPrint('Interpreter Created Successfully');
    } catch (e) {
      debugPrint(
          'Unable to create interpreter, Caught Exception: ${e.toString()}');
    }
  }

  List<double> predict(List<num> values) {
    var input = [values.map((e) => e.toDouble()).toList()]
        .reshape([1, 5]);
    var output = List<double>.filled(1, 0).reshape([1, 1]);
    // runs inference
    _interpreter.run(input, output);
    return [output[0][0]];
  }
}
