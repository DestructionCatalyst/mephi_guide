

import 'dart:async';

import 'package:mephi_guide/data/asset_json_loader.dart';
import 'package:mephi_guide/data/disposable.dart';
import 'package:mephi_guide/data/list_json_convert.dart';
import 'package:mephi_guide/menu/menu.dart';

class MenuBloc implements Disposable{

  static const String assetName = 'assets/config/menu_config.json';

  StreamController<List<MenuTile>>_inController = StreamController<List<MenuTile>>();

  Sink<List<MenuTile>> get _inControllerData => _inController.sink;
  Stream<List<MenuTile>> get _outControllerData => _inController.stream;

  List<MenuTile> tiles;

  StreamController<List<MenuTile>>_tileController;

  Sink<List<MenuTile>> get _inData => _tileController.sink;
  Stream<List<MenuTile>> get outData => _tileController.stream;

  MenuBloc(){

    _outControllerData.listen((event) => tiles = event);

    AssetJsonLoader(assetName).loadAsset().then(
            (value) =>_inControllerData.add(
            listJsonConvert((json)=>MenuTile.fromMap(json))(value)
        )
    );

    _tileController = StreamController<List<MenuTile>>.broadcast(
      onListen: () =>
        _inData.add(tiles)
    );

  }

  @override
  void dispose() {
    _inController.close();
    _tileController.close();
  }

}