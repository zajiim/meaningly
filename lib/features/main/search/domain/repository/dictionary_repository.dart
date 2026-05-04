import 'package:meaningly/core/error/failure.dart';
import '../entities/dictionary_word_entity.dart';
import 'package:fpdart/fpdart.dart';


abstract class DictionaryRepository {
  Future<Either<Failure, List<DictionaryWordEntity>>> searchWords(String query);
}