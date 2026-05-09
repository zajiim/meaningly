import 'package:chopper/chopper.dart';
import 'package:meaningly/features/main/search/data/datasources/local/local_dictionary_data_source.dart';
import 'package:meaningly/features/main/search/domain/usecases/clear_recent_search_history_use_case.dart';
import 'package:meaningly/features/main/search/domain/usecases/get_recent_search_history_use_case.dart';
import 'package:meaningly/features/main/search/domain/usecases/get_search_suggestions_use_case.dart';
import 'package:meaningly/features/main/search/domain/usecases/search_words_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/database/database_service.dart';
import '../data/datasources/remote/dictionary_api_service.dart';
import '../data/repository/dictionary_repository_impl.dart';
import '../domain/repository/dictionary_repository.dart';

part 'dictionary_di_providers.g.dart';

@Riverpod(keepAlive: true)
ChopperClient chopperClient(Ref ref) {
  return ChopperClient(
    baseUrl: Uri.parse(baseUrl),
    services: [DictionaryApiService.create()],
    converter: const JsonConverter(),
    interceptors: [HttpLoggingInterceptor()],
  );
}


@Riverpod(keepAlive: true)
DictionaryApiService dictionaryApiService(Ref ref) {
  return ref.watch(chopperClientProvider)
      .getService<DictionaryApiService>();
}

@Riverpod(keepAlive: true)
DatabaseService databaseService(Ref ref) {
  return DatabaseService();
}

@Riverpod(keepAlive: true)
LocalDictionaryDataSource localDictionaryDataSource(Ref ref) {
  final dbService = ref.watch(databaseServiceProvider);
  return LocalDictionaryDataSourceImpl(dbService);
}


@Riverpod(keepAlive: true)
DictionaryRepository dictionaryRepository(Ref ref) {
  final apiService = ref.watch(dictionaryApiServiceProvider);
  final localDataSource = ref.watch(localDictionaryDataSourceProvider);
  return DictionaryRepositoryImpl(apiService, localDataSource);
}

@Riverpod(keepAlive: true)
SearchWordsUseCase searchWordsUseCase(Ref ref) {
  final repository = ref.watch(dictionaryRepositoryProvider);
  return SearchWordsUseCase(repository);
}

@Riverpod(keepAlive: true)
GetSearchSuggestionsUseCase getSearchSuggestionsUseCase(Ref ref) {
  final repository = ref.watch(dictionaryRepositoryProvider);
  return GetSearchSuggestionsUseCase(repository);
}


@Riverpod(keepAlive: true)
GetRecentSearchHistoryUseCase getRecentSearchHistoryUseCase(Ref ref) {
  final repository = ref.watch(dictionaryRepositoryProvider);
  return GetRecentSearchHistoryUseCase(repository);
}

@Riverpod(keepAlive: true)
ClearRecentSearchHistoryUseCase clearRecentSearchHistoryUseCase(Ref ref) {
  final repository = ref.watch(dictionaryRepositoryProvider);
  return ClearRecentSearchHistoryUseCase(repository);
}


