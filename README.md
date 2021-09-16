# logger_flutter_viewer

The package is an extension for logger. You can add it to any Flutter app. Just shake the phone to show the console.

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