import 'package:fpdart/fpdart.dart';
import 'package:meaningly/core/error/failure.dart';
import 'package:meaningly/features/main/bookmarks/data/mappers/bookmark_mappers.dart';
import 'package:meaningly/features/main/bookmarks/domain/repository/bookmark_repository.dart';
import 'package:meaningly/features/main/search/domain/entities/dictionary_word_entity.dart';

import '../../../search/data/mappers/dictionary_mappers.dart';
import '../data_sources/local/bookmark_data_source.dart';

class BookmarkRepositoryImpl implements BookmarkRepository{
  final BookmarkDataSource _bookmarkDataSource;

  BookmarkRepositoryImpl(this._bookmarkDataSource);

  @override
  Future<Either<Failure, Unit>> addBookMark(DictionaryWordEntity word) async{
    try {
      await _bookmarkDataSource.addBookmark(word.toModel());
      return Right(unit);
    } catch(e) {
      return Left(Failure('Failde to add bookmark: $e'));
    }
  }

  @override
  Future<Either<Failure, List<DictionaryWordEntity>>> getBookMarks() async {
    try {
      final bookmarks = await _bookmarkDataSource.getBookmarks();
      final entities = bookmarks.map((e) => e.toEntity()).toList();
      return Right(entities);
    } catch(e) {
      return Left(Failure("Failed to load bookmarks: $e"));
    }
  }

  @override
  Future<Either<Failure, bool>> isBookMarked(String word) async {
    try {
      final isBookmarked = await _bookmarkDataSource.isBookmarked(word);
      return Right(isBookmarked);
    } catch(e) {
      return Left(Failure("Failed to check if bookmarked: $e"));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeBookMark(String word) async {
    try {
      await _bookmarkDataSource.removeBookmark(word);
      return const Right(unit);
    } catch (e) {
      return Left(Failure('Failed to remove bookmark: $e'));
    }
  }
  
}