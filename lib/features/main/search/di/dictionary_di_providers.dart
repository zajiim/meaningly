import 'package:chopper/chopper.dart';
import 'package:meaningly/features/main/search/domain/usecases/search_words_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/datasources/remote/dictionary_api_service.dart';
import '../data/repository/dictionary_repository_impl.dart';
import '../domain/repository/dictionary_repository.dart';

part 'dictionary_di_providers.g.dart';

@Riverpod(keepAlive: true)
ChopperClient chopperClient(Ref ref) {
  return ChopperClient(
    baseUrl: Uri.parse('https://api.dictionaryapi.dev'),
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
DictionaryRepository dictionaryRepository(Ref ref) {
  final apiService = ref.watch(dictionaryApiServiceProvider);
  return DictionaryRepositoryImpl(apiService);
}

@Riverpod(keepAlive: true)
SearchWordsUseCase searchWordsUseCase(Ref ref) {
  final repository = ref.watch(dictionaryRepositoryProvider);
  return SearchWordsUseCase(repository);
}



