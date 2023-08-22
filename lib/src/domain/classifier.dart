abstract class Classifier {
  Future<bool> loadModel();

  List<double> predict(List<num> values);
}
