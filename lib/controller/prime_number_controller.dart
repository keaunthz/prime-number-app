import 'package:flutter/material.dart';

class PrimeNumberController {
  TextEditingController textController = TextEditingController();
  bool isPrime = false;
  String timeTaken = '';
  String result = '';
  bool isPrimeNumber(int number) {
    if (number <= 1) return false;
    if (number <= 3) return true;
    if (number % 2 == 0 || number % 3 == 0) return false;
    for (int i = 5; i * i <= number; i += 6) {
      if (number % i == 0 || number % (i + 2) == 0) return false;
    }

    return true;
  }

  void checkPrimeNumber() {
    final int number = int.parse(textController.text);
    final stopwatch = Stopwatch()..start();

    isPrime = isPrimeNumber(number);

    stopwatch.stop();
    timeTaken = stopwatch.elapsed.toString();
    if (isPrime) {
      result = 'is a Prime Number';
    } else {
      result = 'is not a Prime Number';
    }
  }

  String? validateInteger(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    try {
      int number = int.parse(value);
      if (number < 0) {
        return 'Number cannot be negative';
      }
    } on FormatException {
      return 'Please enter a valid integer';
    } on RangeError {
      return 'Number is out of range';
    }
    return null;
  }
}
