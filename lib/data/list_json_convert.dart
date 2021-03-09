import 'dart:convert';

List<T> Function(String) listJsonConvert<T>(T Function(Map<String, dynamic>) singleJsonConvert)
{
  return (jsonStr) {
    var jsonList = jsonDecode(jsonStr) as List;
    return jsonList.map((tagJson) => singleJsonConvert(tagJson)).toList();
  };
}