import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:archive/archive.dart';
import 'package:flutter/services.dart';

abstract class SplashDataSource {
  Future<Map<String, String>> loadDictionaryData();
}

class SplashDataSourceImpl implements SplashDataSource {
  @override
  Future<Map<String, String>> loadDictionaryData() async {
    // final jsonStr = await rootBundle.loadString('assets/data/dictionary_data.json');

    final ByteData data = await rootBundle.load('assets/data/dictionary_data.json.zip');
    final List<int> bytes = data.buffer.asUint8List();

    return await Isolate.run(() {
      final archive =  ZipDecoder().decodeBytes(bytes);
      final file = archive.first;

      if(file.isFile) {
        final String jsonString = utf8.decode(file.content as List<int>);
        final Map<String, dynamic> decoded = jsonDecode(jsonString);
        return decoded.map((key, value) => MapEntry(key, value.toString()));
      }

      throw Exception("Zip file is empty or invalid");
      // final Map<String, dynamic>decoded = jsonDecode(jsonStr);
      // return decoded.map((key, value) => MapEntry(key, value.toString()));
    });
  }
}
