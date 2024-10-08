import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:keep_fit/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.tape).existsSync(), isTrue);
  });
}
