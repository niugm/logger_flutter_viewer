import 'package:flutter/material.dart';
import 'dart:async';

import 'package:logger/logger.dart';
import 'package:logger_flutter_viewer/logger_flutter_viewer.dart';

void main() {
  runApp(const MyApp());
  log();
}

var logger =
    Logger(printer: PrettyPrinter(printTime: true), output: ScreenOutput());

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

void log() {
  logger.d("Log message with 2 methods");

  loggerNoStack.i("Info message");

  loggerNoStack.w("Just a warning!");

  logger.e("Error! Something bad happened", "Test Error");

  loggerNoStack.v({"key": 5, "value": "something"});

  Future.delayed(const Duration(seconds: 5), log);
}

class ScreenOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    // event.lines.forEach(print);
    LogConsole.add(event);
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
