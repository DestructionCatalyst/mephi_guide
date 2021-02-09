import 'package:flutter_test/flutter_test.dart';
import 'package:mephi_guide/data/parse_date.dart';

main() {
  test('date parse', () async {
    String date = "01.09.2019";

    expect(parseDate(date), new DateTime.utc(2019, 8, 31, 21).toLocal());

  });
}