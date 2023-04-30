import 'package:email_validator/email_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'test for email validator lib',
    () {
      test(
        'should be return `false`',
            () {
          bool result = EmailValidator.validate('alaki@.com');
          expect(result, false);
        },
      );

      test(
        'should be return `true`',
        () {
          bool result = EmailValidator.validate('shervin.hz07@gmail.com');
          expect(result, true);
        },
      );

      test(
        'should be return `false`',
        () {
          bool result = EmailValidator.validate('shervin.hz07@');
          expect(result, false);
        },
      );

      test(
        'should be return `false`',
        () {
          bool result = EmailValidator.validate('shervin.hz07@gmail');
          expect(result, false);
        },
      );

      test(
        'should be return `false`',
        () {
          bool result = EmailValidator.validate('shervin');
          expect(result, false);
        },
      );

      test(
        'should be return `true`',
        () {
          bool result = EmailValidator.validate('a@gmail.com');
          expect(result, true);
        },
      );
    }
  );
}