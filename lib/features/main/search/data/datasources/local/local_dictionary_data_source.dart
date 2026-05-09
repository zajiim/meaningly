import 'dart:convert';

import 'package:meaningly/core/database/database_service.dart';
import 'package:meaningly/features/main/search/data/models/dictionary_word_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../../core/constants/app_constants.dart';

abstract class LocalDictionaryDataSource {
  Future<void> cacheWord(List<DictionaryWordModel> words);

  Future<List<DictionaryWordModel>?> getCachedWord(String query);

  Future<void> saveRecentSearchHistory(String query);

  Future<List<String>> getRecentSearchHistories();

  Future<void> clearRecentSearchHistory();
  
  Future<void> populateOfflineDictionary(Map<String, String> data);

  Future<String?> getOfflineWordMeaning(String word);

  Future<List<String>> getOfflineSearchSuggestions(String query);

  Future<List<MapEntry<String, String>>> getOfflineWords({String query = ''});
}

class LocalDictionaryDataSourceImpl implements LocalDictionaryDataSource {
  final DatabaseService _databaseService;

  LocalDictionaryDataSourceImpl(this._databaseService);

  @override
  Future<void> cacheWord(List<DictionaryWordModel> words) async {
    if (words.isEmpty) return;
    final db = await _databaseService.database;
    final word = words.first.word;
    if (word == null) return;

    await db.insert(cachedWordsTableName, {
      'word': word.toLowerCase(),
      'data': jsonEncode(words.map((e) => e.toJson()).toList()),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }


  @override
  Future<List<DictionaryWordModel>?> getCachedWord(String query) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      // 'cached_words',
      cachedWordsTableName,
      where: 'word = ?',
      whereArgs: [query.toLowerCase()],
    );

    if (maps.isNotEmpty) {
      final String data = maps.first['data'] as String;
      final List<dynamic> decoded = jsonDecode(data);
      return decoded.map((e) => DictionaryWordModel.fromJson(e)).toList();
    }
    return null;
  }

  @override
  Future<List<String>> getRecentSearchHistories() async{
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      // 'recent_searches',
      recentSearchTableName,
      orderBy: 'created_at DESC',
    );

    return maps.map((e) => e['query'] as String).toList();
  }

  @override
  Future<void> saveRecentSearchHistory(String query) async {
    if (query.isEmpty) return;
    final db = await _databaseService.database;

    await db.transaction((txn) async {
      await txn.delete(
        recentSearchTableName,
        where: 'query = ?',
        whereArgs: [query.toLowerCase()],
      );

      await txn.insert(
        recentSearchTableName,
        {
          'query': query.toLowerCase(),
          'created_at': DateTime.now().millisecondsSinceEpoch,
        },
      );
    });
  }
  @override
  Future<void> clearRecentSearchHistory() async {
    final db = await _databaseService.database;
    await db.delete(recentSearchTableName);
  }

  @override
  Future<List<String>> getOfflineSearchSuggestions(String query) async {
    final db = await _databaseService.database;
    final maps = await db.query(
      offlineDictionaryTableName,
      columns: ['word'],
      where: 'word LIKE ?',
      whereArgs: ['$query%'],
      limit: 20,
    );
    return maps.map((e) => e['word'] as String).toList();
  }

  @override
  Future<String?> getOfflineWordMeaning(String word) async {
    final db = await _databaseService.database;
    final maps = await db.query(
      offlineDictionaryTableName,
      where: 'word = ?',
      whereArgs: [word],
    );
    if (maps.isNotEmpty) return maps.first['meaning'] as String;
    return null;
  }

  @override
  Future<List<MapEntry<String, String>>> getOfflineWords({String query = ''}) async {
    final db = await _databaseService.database;
    final maps = await db.query(
      offlineDictionaryTableName,
      where: query.isNotEmpty ? 'word LIKE ?' : null,
      whereArgs: query.isNotEmpty ? ['$query%'] : null,
      orderBy: 'word ASC',
    );
    return maps.map((e) => MapEntry(e['word'] as String, e['meaning'] as String)).toList();
  }

  @override
  Future<void> populateOfflineDictionary(Map<String, String> data) async{
    final db = await _databaseService.database;
    final batch = db.batch();
    for(final entry in data.entries) {
      batch.insert(
          offlineDictionaryTableName,
          {'word': entry.key, 'meaning': entry.value},
        conflictAlgorithm: ConflictAlgorithm.replace
      );
    }
    await batch.commit(noResult: true);
  }
}
