import 'package:meaningly/features/main/search/di/dictionary_di_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'collections_di_providers.g.dart';
@riverpod
FutureOr<List<MapEntry<String, String>>> offlineWords(Ref ref, String query) async {
  final localDataSource = ref.watch(localDictionaryDataSourceProvider);
  return await localDataSource.getOfflineWords(query: query);
}