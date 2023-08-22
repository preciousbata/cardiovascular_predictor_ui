import 'package:cardiovascular_predictor_ui/src/utils/mock_classifier_impl.dart';
import 'package:test/test.dart';

void main() {
  const correctFilePath = 'pathFile.tflite';
  const incorrectFilePath = 'image.png';

  test('Check loadModel return true  if correct  file path is provided',
      () async {
    final classifer = MockClassifier(correctFilePath);
    final result = await classifer.loadModel();
    expect(
      result,
      equals(true),
    );
  });
  test('Check loadModel return false  if incorrect  file path is provided',
      () async {
    final classifer = MockClassifier(incorrectFilePath);
    final result = await classifer.loadModel();
    expect(
      result,
      equals(false),
    );
  });
  // test('Testing Classifier Predict Method', () {
  //   final clf = Classifier(clf_model);
  //   expect(clf.predict([189, 98, 198, 22, 78]), equals(0.6));
  // });
}
