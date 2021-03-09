
import 'package:flutter/services.dart';

class AssetJsonLoader{

  final String assetName;

  AssetJsonLoader(this.assetName);

  Future<String> loadAsset() async {
    return await rootBundle.loadString(assetName);
  }
}