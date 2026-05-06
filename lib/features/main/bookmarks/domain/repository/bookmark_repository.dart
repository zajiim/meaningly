import 'package:fpdart/fpdart.dart';
import 'package:meaningly/core/error/failure.dart';
import 'package:meaningly/features/main/search/domain/entities/dictionary_word_entity.dart';

abstract class BookmarkRepository {
  Future<Either<Failure, Unit>> addBookMark(DictionaryWordEntity word);
  Future<Either<Failure, Unit>> removeBookMark(String word);
  Future<Either<Failure, List<DictionaryWordEntity>>> getBookMarks();
  Future<Either<Failure, bool>> isBookMarked(String word);
}