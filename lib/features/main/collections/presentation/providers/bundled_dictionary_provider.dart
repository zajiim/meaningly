import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bundled_dictionary_provider.g.dart';

Map<String, String> _parseDictionaryJson(String jsonStr) {
  final Map<String, dynamic> decoded = jsonDecode(jsonStr);
  return decoded.map((key, value) => MapEntry(key, value.toString()));
}

@Riverpod(keepAlive: true)
Future<Map<String, String>> bundledDictionary(Ref ref) async {
  try {
    final jsonStr = await rootBundle.loadString('assets/data/dictionary_data.json');
    return await compute(_parseDictionaryJson, jsonStr);
  } catch (e) {
    debugPrint("Failed to load bundled dictionary: $e");
    return {};
  }
}
