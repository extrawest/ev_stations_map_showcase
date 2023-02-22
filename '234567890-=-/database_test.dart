import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  defineTests();
}

void defineTests() {
  group('database tests', () {
    const MethodChannel channel =
        MethodChannel('plugins.flutter.io/path_provider');
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '.';
    });
  });
}
