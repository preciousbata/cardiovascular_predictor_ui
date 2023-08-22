import 'package:cardiovascular_predictor_ui/injection.dart';
import 'package:cardiovascular_predictor_ui/src/domain/classifier.dart';
import 'package:logger/logger.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

final logger = sl.get<Logger>();

class ClassifierImpl implements Classifier {
  // name of the model file
  final String modelFile;

  // TensorFlow Lite Interpreter object
  late Interpreter _interpreter;

  ClassifierImpl(this.modelFile) {
    loadModel();
  }

  @override
  Future<bool> loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset(modelFile);
      logger.i('Model has been loaded Successfully');
      return true;
    } catch (e) {
      logger.d('Unable to create Interpreter, ${e.toString()}');
      return false;
    }
  }

  @override
  List<double> predict(List<num> values) {
    var input = [values.map((e) => e.toDouble()).toList()].reshape([1, 5]);
    var output = List<double>.filled(1, 0).reshape([1, 1]);
    // runs inference
    _interpreter.run(input, output);
    return [output[0][0]];
  }
}
