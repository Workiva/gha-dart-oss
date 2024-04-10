import 'dart:html';

import 'package:test/test.dart';

void main() {
  test('some test', () {
    document.body.append(DivElement()..id = 'someId');
    expect(document.body.querySelector('div').id, 'someId');
  });
}