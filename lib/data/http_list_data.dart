import 'package:mephi_guide/data/http_data.dart';

import 'list_json_convert.dart';

class HttpListData<T> extends HttpData<List<T>>
{
  HttpListData(T Function(Map<String, dynamic>) jsonConvertFunction) :
        super(listJsonConvert(jsonConvertFunction));

}
