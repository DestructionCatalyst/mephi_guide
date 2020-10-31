import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

import 'package:mephi_guide/data/disposable.dart';
import 'package:mephi_guide/data/http_fetch.dart';

class HttpData<T> implements Disposable{

  T Function(String) jsonConverter;

  final StreamController<T> _dataController = StreamController<T>();

  Sink<T> get _inData => _dataController.sink;
  Stream<T> get outData => _dataController.stream;

  HttpData(T Function(String) jsonConvertFunction):
  jsonConverter = jsonConvertFunction;

  void loadData(String webPage, [http.Client client]) {
    if (client == null)
      client = IOClient();

    Fetcher().fetch(client, webPage).then((response) {
      if(response.statusCode == 200){
        //outData.drain();

        T fromJson = jsonConverter(response.body);
        _inData.add(fromJson);
        //print("ass");

      }
      else{

        //Notify of error
      }
    });


  }

  @override
  void dispose() {
    _dataController.close();
  }
}