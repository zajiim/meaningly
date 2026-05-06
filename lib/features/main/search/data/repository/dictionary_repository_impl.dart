import 'package:flutter/cupertino.dart';
import 'package:fpdart/src/either.dart';
import 'package:meaningly/core/error/failure.dart';

import '../../../collections/data/mappers/dictionary_mapper.dart';
import '../../domain/entities/dictionary_word_entity.dart';
import '../../domain/repository/dictionary_repository.dart';
import '../datasources/local/local_dictionary_data_source.dart';
import '../datasources/remote/dictionary_api_service.dart';
import '../mappers/dictionary_mappers.dart';
import '../models/dictionary_word_model.dart';

class DictionaryRepositoryImpl implements DictionaryRepository {
  final DictionaryApiService _api;
  final LocalDictionaryDataSource _local;
  final Future<Map<String, String>> Function() _getBundledDictionary;


  const DictionaryRepositoryImpl(this._api, this._local, this._getBundledDictionary);

  @override
  Future<Either<Failure, List<DictionaryWordEntity>>> searchWords(
    String query,
  ) async {
    try {
      final cachedWords = await _local.getCachedWord(query);

      if (cachedWords != null && cachedWords.isNotEmpty) {
        debugPrint("Returning from CACHE for: $query");
        return Right(cachedWords.map((e) => e.toEntity()).toList());
      }

      final response = await _api.getWordsDetails(query.trim());
      debugPrint("response isss ====>>> $response");
      if (response.isSuccessful && response.body != null) {
        // debugPrint("condition satisfied====>>>> ${response.body?.map((u) => u.toEntity())}");
        final data = response.body as List;
        final models = data
            .map((json) => DictionaryWordModel.fromJson(json))
            .toList();
        debugPrint("Response isssss====>>>> $models");
        await _local.cacheWord(models);

        await _local.saveRecentSearchHistory(query);

        return Right(models.map((e) => e.toEntity()).toList());
        // return Right(response.body!.map((e) => e.toEntity()).toList());
      } else {
        // return Left(Failure('Something went wrong'));
        return await _getOfflineFallback(query);
      }
    } on Exception catch (e) {
      // final bundledDict = await _getBundledDictionary();
      // final localDef = bundledDict[query.toLowerCase()];
      // if (localDef != null) {
      //   debugPrint("Returning from BUNDLED DICTIONARY for: $query");
      //   return Right([DictionaryWordEntity.fromLocalDictionary(query.toLowerCase(), localDef)]);
      // }
      // return Left(Failure('Network error $e'));
      debugPrint("API Exception: $e. Checking bundled dictionary...");
      return await _getOfflineFallback(query);
    }
  }

  Future<Either<Failure, List<DictionaryWordEntity>>> _getOfflineFallback(String query) async {
    final bundledDict = await _getBundledDictionary();
    final localDef = bundledDict[query];

    if (localDef != null) {
      debugPrint("Returning from BUNDLED DICTIONARY for: $query");

      final entity = localDef.toEntityFromOffline(query);

      return Right([entity]);
    }

    return Left(Failure('Word not found in online or offline database.'));
  }

  @override
  Future<void> clearRecentSearchHistory() async {
    await _local.clearRecentSearchHistory();
  }

  @override
  Future<Either<Failure, List<String>>> getRecentSearchHistory() async {
    try {
      final searches = await _local.getRecentSearchHistories();
      return Right(searches);
    } catch (e) {
      return Left(Failure('Failed to load recent searches'));
    }
  }

  @override
  Future<void> saveRecentSearchHistory(String query) async {
    await _local.saveRecentSearchHistory(query);
  }
}
