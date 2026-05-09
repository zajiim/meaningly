import 'package:flutter/foundation.dart';
import 'package:meaningly/features/main/search/data/datasources/local/local_dictionary_data_source.dart';
import 'package:meaningly/features/splash/data/datasources/local/splash_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_constants.dart';
import '../../domain/repositories/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashDataSource localDataSource;
  final LocalDictionaryDataSource localDictionaryDataSource;
  final SharedPreferences sharedPreferences;

  SplashRepositoryImpl(this.localDataSource, this.localDictionaryDataSource, this.sharedPreferences);

  @override
  Future<void> loadDictionary() async {
    try {
      final isLoaded = sharedPreferences.getBool(isDictionaryLoadedKey) ?? false;
      if (isLoaded) {
        return;
      }
      final dictionaryData = await localDataSource.loadDictionaryData();
      await localDictionaryDataSource.populateOfflineDictionary(dictionaryData);
      await sharedPreferences.setBool(isDictionaryLoadedKey, true);
    } catch (e) {
      debugPrint("Failed to load bundled dictionary: $e");
    }
  }
}
