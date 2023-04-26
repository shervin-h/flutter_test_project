
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_project/core/utils/read_json_file_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group(
    'readJson test',
    () {
      test(
        'should be return `true`',
        () async {
          // users.json file contains json array as root then we have a dart List
          var result = await readJson(path: 'assets/users.json');
          expect(result is List, true);
        }
      );

      test(
        'should be return `true`',
        () async {
          var result = await readJson(path: 'assets/users.json');
          expect((result as List).first is Map, true);
        }
      );

      test(
        'should be return `milad`',
        () async {
          var result = await readJson(path: 'assets/users.json');
          expect((result as List).last['username'] , 'milad');
        }
      );
    },
  );

}