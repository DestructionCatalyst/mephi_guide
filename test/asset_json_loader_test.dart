import 'package:flutter_test/flutter_test.dart';
import 'package:mephi_guide/data/asset_json_loader.dart';
import 'package:mephi_guide/data/list_json_convert.dart';
import 'package:mephi_guide/menu/menu.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('json asset load', () async {
   AssetJsonLoader('assets/config/menu_config.json').loadAsset().then(
           (value) => print(listJsonConvert((json)=>MenuTile.fromMap(json))(value))
   );

  });
}