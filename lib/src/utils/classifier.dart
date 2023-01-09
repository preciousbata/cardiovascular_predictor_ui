import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  // name of the model file
  final _modelFile = 'model.tflite';

  // TensorFlow Lite Interpreter object
  late Interpreter _interpreter;

  late List<int> _inputShape;
  late List<int> _outputShape;
  late TfLiteType _inputType;
  late TfLiteType _outputType;

  Classifier() {
    // Load model when the classifier is initialized.
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      _interpreter =
          await Interpreter.fromAsset(_modelFile);
      debugPrint('Interpreter Created Successfully');

      _inputShape = _interpreter.getInputTensor(0).shape;
      debugPrint(_inputShape.toString());
      _outputShape = _interpreter.getOutputTensor(0).shape;
      debugPrint(_outputShape.toString());
      _inputType = _interpreter.getInputTensor(0).type;
      _outputType = _interpreter.getOutputTensor(0).type;
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

    // var result = 0;
    // if ((output[0][0] as double) >
    //     (output[0][1] as double)) {
    //   result = 0;
    // } else {
    //   result = 1;
    // }
    return [output[0][0], output[0][1]];
  }
}
