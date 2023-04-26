

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_project/core/utils/password_validation_helper.dart';

void main() {
  
  group(
    'isPasswordValid test',
    () {
      test(
        'should be return `false`',
        () {
          bool result = isPasswordValid('some lower case string');
          expect(result, false);
        },
      );

      test(
        'should be return `false`',
        () {
          bool result = isPasswordValid('SOME UPPER CASE STRING');
          expect(result, false);
        },
      );

      test(
        'should be return `false`',
        () {
          bool result = isPasswordValid('less8');
          expect(result, false);
        },
      );

      test(
        'should be return `true`',
        () {
          bool result = isPasswordValid('hsdkY7L@');
          expect(result, true);
        },
      );

      test(
        'should be return `false`',
        () {
          bool result = isPasswordValid('hsdkY7Lf');
          expect(result, false);
        },
      );
    },
  );

}