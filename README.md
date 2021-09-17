# logger_flutter_viewer

The package is an extension for [logger](https://pub.dev/packages/logger). You can add it to any Flutter app. Just shake the phone to show the console.

The package is clone from [logger_flutter](https://github.com/leisim/logger_flutter), and some update:

* fix some bugs
* upgrade logger to latest version
* replace [sensors](https://pub.dev/packages/sensors) with [sensors_plus](https://pub.dev/packages/sensors_plus)

## Platform Support

| Android |  iOS  | MacOS |  Web  | Linux | Windows |
| :-----: | :---: | :---: | :---: | :---: | :-----: |
|   ✔️   |   ✔️   |      |     |       |         |


## Getting Started

``` dart
import 'package:logger/logger.dart';

class ScreenOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    LogConsole.output(event);
  }
}

var logger = Logger(
    printer: PrettyPrinter(printTime: true, colors: true, printEmojis: true),
    output: ScreenOutput());

logger.i("Just a info message");    
```

## License

[MIT](https://opensource.org/licenses/MIT)

Copyright (c) 2013-present, Guomeng(Peter) Niu