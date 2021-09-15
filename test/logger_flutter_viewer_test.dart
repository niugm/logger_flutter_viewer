import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:logger_flutter_viewer/logger_flutter_viewer.dart';

void main() {
  const MethodChannel channel = MethodChannel('logger_flutter_viewer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await LoggerFlutterViewer.platformVersion, '42');
  // });
}
