import 'dart:convert';

import 'package:mephi_guide/data/http_data.dart';

class HttpListData<T> extends HttpData<List<T>>
{
  HttpListData(T Function(String p1) jsonConvertFunction) :
        super(listJsonConvert(jsonConvertFunction));

}

List<T> Function(String) listJsonConvert<T>(T Function(String) singleJsonConvert)
{
  return (jsonStr) {
    var jsonList = jsonDecode(jsonStr) as List;
    return jsonList.map((tagJson) => singleJsonConvert(tagJson)).toList();
  };
}