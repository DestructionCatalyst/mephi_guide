

List<T> parseStringToList<T>(String str, T Function(String) parseItem){

  assert(str[0] == '[');
  assert(str[str.length - 1] == ']');

  List<String> strList = str.substring(1, str.length - 1).split(", ");

  return List<T>.generate(strList.length, (index) => parseItem(strList[index]));
}