import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mephi_guide/data/disposable.dart';
import 'package:mephi_guide/data/http_fetch.dart';

class HttpData<T> implements Disposable{

  T Function(String) jsonConverter;

  final StreamController<T> _dataController = StreamController<T>.broadcast();

  //@protected
  Sink<T> get inData => _dataController.sink;
  Stream<T> get outData => _dataController.stream;

  HttpData(T Function(String) jsonConvertFunction):
  jsonConverter = jsonConvertFunction;

  Future<bool> loadData(String webPage, [http.Client client]) async {
    bool res = false;

    if (client == null)
      client = IOClient();

    var response = await Fetcher().fetch(client, webPage);

    if(response.statusCode == 200){

      T fromJson = jsonConverter(response.body);
      inData.add(fromJson);

      res = true;
      print("Loaded!" + res.toString());
    }
    else {
      //Notify of error
      res = false;
    }
    /*
      responce = await Fetcher().fetch(client, webPage).then((response) {
      if(response.statusCode == 200){

        T fromJson = jsonConverter(response.body);
        inData.add(fromJson);

        res = true;
        print("Loaded!" + res.toString());
      }
      else{
        //Notify of error
        res = false;
        print("Error!" + res.toString());
      }
    });
    */
    return res;
  }

  @override
  void dispose() {
    _dataController.close();
  }
}