
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class LocalFile<T>{

  final String _filename;
  final T Function(String) _parseFunction;

  LocalFile(this._filename, this._parseFunction);

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_filename');
  }

  Future<File> writeFile(T content) async {
    final file = await _localFile;

    // Write the file.
    return file.writeAsString(content.toString());
  }

  Future<T> readFile() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();

      return _parseFunction(contents);
    } catch (e) {
      // If encountering an error, return 0.
      return null;
    }
  }


}