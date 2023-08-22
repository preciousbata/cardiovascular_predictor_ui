import 'package:cardiovascular_predictor_ui/src/domain/classifier.dart';

class MockClassifier implements Classifier {
  final String modelFile;
  MockClassifier(this.modelFile);

  @override
  Future<bool> loadModel() => Future.delayed(const Duration(seconds: 2), () {
        return modelFile.endsWith('.tflite') ? true : false;
      });

  @override
  List<double> predict(List<num> values) {
    return [0.3];
  }
}
