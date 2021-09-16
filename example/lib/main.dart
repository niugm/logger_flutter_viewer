import 'package:flutter/material.dart';
import 'dart:async';

import 'package:logger/logger.dart';
import 'package:logger_flutter_viewer/logger_flutter_viewer.dart';

void main() {
  runApp(const MyApp());
  log();
}

var logger = Logger(
    printer: PrettyPrinter(printTime: true, colors: true, printEmojis: true),
    output: ScreenOutput());

void log() {
  logger.d("This is a debug message");

  logger.i("Just a info message");

  logger.w("This is a warning!");

  logger.e("Error! Something bad happened", "Test Error");

  logger.v({"key": 5, "value": "something"});

  Future.delayed(const Duration(seconds: 5), log);
}

class ScreenOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    LogConsole.output(event);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LogConsoleOnShake(
          dark: false,
          child: Center(
            child: Text("Shake Phone to open Console."),
          ),
        ),
      ),
    );
  }
}
