import 'package:flutter_test/flutter_test.dart';
import 'package:mephi_guide/data/parse_string_to_list.dart';

main() {
  test('string to int list parse', () async {
    String str = "[1, 1, 22, 5]";

    List<int> expected = [1, 1, 22, 5];

    expect(parseStringToList(str, int.parse), expected);
  });
}