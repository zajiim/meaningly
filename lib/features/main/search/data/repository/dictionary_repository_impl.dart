import 'package:flutter/cupertino.dart';
import 'package:fpdart/src/either.dart';
import 'package:meaningly/core/error/failure.dart';
import 'package:meaningly/features/main/search/data/models/dictionary_word_model.dart';

import '../../domain/entities/dictionary_word_entity.dart';
import '../../domain/repository/dictionary_repository.dart';
import '../datasources/remote/dictionary_api_service.dart';
import '../mappers/dictionary_mappers.dart';

class DictionaryRepositoryImpl implements DictionaryRepository {
  final DictionaryApiService _api;

  const DictionaryRepositoryImpl(this._api);

  @override
  Future<Either<Failure, List<DictionaryWordEntity>>> searchWords(
    String query,
  ) async {
    try {
      final response = await _api.getWordsDetails(query.trim());
      if (response.isSuccessful && response.body != null) {
        debugPrint("condition satisfied====>>>> ${response.body?.map((u) => u.toEntity())}");
        return Right(response.body!.map((e) => e.toEntity()).toList());
      } else if (response.statusCode == 404) {
        return Left(Failure('No results found'));
      } else {
        return Left(Failure('Something went wrong'));
      }
    } on Exception catch (e) {
      return Left(Failure('Network error $e'));
    }
  }
}
