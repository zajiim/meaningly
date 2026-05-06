import 'dart:convert';

import 'package:meaningly/core/constants/app_constants.dart';
import 'package:meaningly/core/database/database_service.dart';
import 'package:meaningly/features/main/search/data/models/dictionary_word_model.dart';

abstract class BookmarkDataSource {
  Future<void> addBookmark(DictionaryWordModel word);
  Future<void> removeBookmark(String word);
  Future<List<DictionaryWordModel>> getBookmarks();
  Future<bool> isBookmarked(String word);
}

class BookmarkDataSourceImpl implements BookmarkDataSource {
  final DatabaseService _databaseService;

  BookmarkDataSourceImpl(this._databaseService);

  @override
  Future<void> addBookmark(DictionaryWordModel word) async {
    final db = await _databaseService.database;
    await db.insert(
        bookmarksTableName,
        {
          'word': word.word,
          'data': jsonEncode(word.toJson()),
          'created_at': DateTime.now().millisecondsSinceEpoch,
        }
    );
  }

  @override
  Future<List<DictionaryWordModel>> getBookmarks() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      bookmarksTableName,
      orderBy: 'created_at DESC',
    );
    return List.generate(maps.length, (index) => DictionaryWordModel.fromJson(jsonDecode(maps[index]['data'])));
  }

  @override
  Future<bool> isBookmarked(String word) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      bookmarksTableName,
      where: 'word = ?',
      whereArgs: [word]
    );
    return maps.isNotEmpty;
  }

  @override
  Future<void> removeBookmark(String word) async {
    final db = await _databaseService.database;
    await db.delete(
      bookmarksTableName,
      where: 'word = ?',
      whereArgs: [word],
    );
  }

}