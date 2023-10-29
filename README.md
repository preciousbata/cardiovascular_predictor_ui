# Cardiovascular Predictor 

This project is the implementation of on-device machine learning using *tflite_flutter* which takes in input from the user to predict the probability of having a cardiovascular disease.

# (Important) Initial setup
**Linux and Mac users**

Copy the install.sh file in the root folder of your app, and execute the command, sh install.sh in the root folder

**Windows users**

Copy the install.bat file in the root folder of your app, and execute the command, install.bat in the root folder.

This will automatically download the latest binaries from release assets and place them in appropriate folders for you.

# Demo

https://github.com/preciousbata/cardiovascular_predictor_ui/assets/42701343/aee4dbeb-b509-405c-a59a-47273178b9b0


## Packages

The following packages are used in this project:

### get_it

**Package Description:** The `get_it` package is a simple service locator for Dart and Flutter projects. It allows for the easy management of dependency injection and provides a way to locate and retrieve instances of registered services or objects.

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

**See Demo**
