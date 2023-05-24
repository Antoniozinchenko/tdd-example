import 'package:clientapp/utils/string_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('parse strings util', () {
    test('accepts string', () {
      const input = 'some string';
      const output = ['some string'];
      expect(parseStrings(input), output);
    });

    test('accepts array', () {
      const input = [1, null, 'some string 1', true, 'some string 2'];
      const output = ['some string 1', 'some string 2'];
      expect(parseStrings(input), output);
    });

    test('accepts map', () {
      const input = {
        'a': 1,
        'b': null,
        23: 'some string 1',
        'c': true,
        'd': 'some string 2'
      };
      const output = ['some string 1', 'some string 2'];
      expect(parseStrings(input), output);
    });

    test('accepts map with nested objects', () {
      const input = {
        'a': {
          'nested 1': [
            'nested array 1',
            null,
            1,
            2,
            'nested array 2',
            {
              'nested 2': [
                'nested object 1',
                true,
                false,
              ],
              0: 'nested object 2'
            }
          ],
        },
        'b': null,
        23: 'some string 1',
        'c': true,
        'd': 'some string 2'
      };
      const output = [
        'nested array 1',
        'nested array 2',
        'nested object 1',
        'nested object 2',
        'some string 1',
        'some string 2'
      ];
      expect(parseStrings(input), output);
    });

    test('accepts null', () {
      expect(parseStrings(null), []);
    });
    test('accepts boolean', () {
      expect(parseStrings(true), []);
      expect(parseStrings(false), []);
    });
    test('accepts number', () {
      expect(parseStrings(100), []);
      expect(parseStrings(0), []);
    });
  });
}
