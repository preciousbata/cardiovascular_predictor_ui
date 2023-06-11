# Cardiovascular Predictor 

This project is the implementation of on-device machine learning using *tflite_flutter* which takes in input from the user to predict the probability of having a cardiovascular disease.

# (Important) Initial setup
**Linux and Mac users**

Copy the install.sh file in the root folder of your app, and execute the command, sh install.sh in the root folder, text_classification_app/ in our case.

**Windows users**

Copy the install.bat file in the root folder of your app, and execute the command, install.bat in the root folder, text_classification_app/ in our case.

This will automatically download the latest binaries from release assets and place them in appropriate folders for you.

# Demo
![cardio_app_demo](https://user-images.githubusercontent.com/42701343/212425392-db40f736-5a59-4eac-9939-adc852af0941.gif)

## Packages

The following packages are used in this project:

### get_it

**Package description:** The `get_it` package is a simple service locator for Dart and Flutter projects. It allows for the easy management of dependency injection and provides a way to locate and retrieve instances of registered services or objects.

**Usage:**

```dart
dependencies:
  get_it: ^version_number
```

### flutter_bloc

**Package description:** The `flutter_bloc` package is a state management library for Flutter applications. It provides a predictable state management pattern, known as BLoC (Business Logic Component), which separates the presentation layer from the business logic and state management. It helps in building reactive and maintainable applications.

**Usage:**

```dart
dependencies:
  flutter_bloc: ^version_number
```

### tflite

**Package description:** The `tflite` package provides Flutter bindings for TensorFlow Lite, a lightweight machine learning framework designed for mobile and embedded devices. It allows developers to run pre-trained machine learning models on the Flutter platform, enabling tasks such as image classification, object detection, and more.

**Usage:**

```dart
dependencies:
  tflite: ^version_number
```

## Installation

1. Clone the repository:

   ```shell
   git clone https://github.com/your/repository.git
   ```

2. Change to the project directory:

   ```shell
   cd project_directory
   ```

3. Install the required packages:

   ```shell
   flutter pub get
   ```

## Configuration

No additional configuration steps are required for the packages mentioned above.

## Usage

1. Import the necessary packages in your Dart files:

   ```dart
   import 'package:get_it/get_it.dart';
   import 'package:flutter_bloc/flutter_bloc.dart';
   import 'package:tflite/tflite.dart';
   ```

2. Utilize the `get_it` package to register and retrieve services or objects:

   ```dart
   // Register a service
   GetIt locator = GetIt.instance;
   locator.registerSingleton<MyService>(MyService());

   // Retrieve a service
   MyService service = locator<MyService>();
   ```

3. Use the `flutter_bloc` package to implement the BLoC pattern:

   ```dart
   // Define a state class
   class MyState extends Equatable {
     final String data;

     MyState(this.data);

     @override
     List<Object> get props => [data];
   }

   // Define an event class
   abstract class MyEvent extends Equatable {
     const MyEvent();

     @override
     List<Object> get props => [];
   }

   // Define a BLoC class
   class MyBloc extends Bloc<MyEvent, MyState> {
     MyBloc() : super(MyState('Initial Data'));

     @override
     Stream<MyState> mapEventToState(MyEvent event) async* {
       // Handle events and yield new states
       if (event is DataUpdatedEvent) {
         yield MyState(event.data);
       }
     }
   }

   // Usage example
   void main() {
     MyBloc myBloc = MyBloc();
     myBloc.add(DataUpdatedEvent('New Data'));
   }
   ```

4. Utilize the `tflite` package to run TensorFlow Lite models:

   ```dart
   // Load a TensorFlow Lite model
   await Tflite.loadModel(
     model: 'assets/model.tflite',
     labels: 'assets/labels.txt',
   );

   // Run inference using the loaded model
   List<dynamic> output = await Tflite.runModelOnImage(
     path: 'path/to/image.jpg',
   );

   //