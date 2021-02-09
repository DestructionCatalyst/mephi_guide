import 'package:intl/intl.dart';

///Parse date in the format dd.MM.yyyy (or separator instead of ".")
DateTime parseDate(String dateString)
{
  return dMy().parse(dateString);
  /*
  return DateTime.tryParse(
      dateString.split(separator)
      .reversed
      .reduce((value, element) => value + "-" + element)
  );*/
}

DateFormat dMy() => DateFormat("dd.MM.yyyy");