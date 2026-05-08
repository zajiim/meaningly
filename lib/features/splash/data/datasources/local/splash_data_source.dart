import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/services.dart';

abstract class SplashDataSource {
  Future<Map<String, String>> loadDictionaryData();
}

class SplashDataSourceImpl implements SplashDataSource {
  @override
  Future<Map<String, String>> loadDictionaryData() async {
    final jsonStr = await rootBundle.loadString('assets/data/dictionary_data.json');

    return await Isolate.run(() {
      final Map<String, dynamic>decoded = jsonDecode(jsonStr);
      return decoded.map((key, value) => MapEntry(key, value.toString()));
    });
  }
}
