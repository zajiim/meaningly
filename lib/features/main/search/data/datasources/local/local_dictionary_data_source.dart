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
      'cached_words',
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
      'recent_searches',
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
        'recent_searches',
        where: 'query = ?',
        whereArgs: [query.toLowerCase()],
      );

      await txn.insert(
        'recent_searches',
        {
          'query': query.toLowerCase(),
          'created_at': DateTime.now().millisecondsSinceEpoch,
        },
      );

      // Keep only last 10 searches
      final count = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM recent_searches'));
      if (count != null && count > 10) {
        await txn.rawDelete('''
          DELETE FROM recent_searches 
          WHERE id IN (
            SELECT id FROM recent_searches 
            ORDER BY created_at ASC 
            LIMIT ?
          )
        ''', [count - 10]);
      }
    });
  }
  @override
  Future<void> clearRecentSearchHistory() async {
    final db = await _databaseService.database;
    await db.delete('recent_searches');
  }
}
