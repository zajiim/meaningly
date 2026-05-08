import 'package:flutter/foundation.dart';
import 'package:meaningly/features/splash/data/datasources/local/splash_data_source.dart';

import '../../domain/repositories/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashDataSource localDataSource;

  SplashRepositoryImpl(this.localDataSource);

  @override
  Future<Map<String, String>> loadDictionary() async {
    try {
      return await localDataSource.loadDictionaryData();
    } catch (e) {
      debugPrint("Failed to load bundled dictionary: $e");
      return {};
    }
  }
}
