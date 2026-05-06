import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_constants.dart';

abstract class LocalOnboardingDataSource {
  Future<void> setOnboardingCompleted(bool value);
  bool getOnboardingCompleted();
}

class LocalOnboardingDataSourceImpl implements LocalOnboardingDataSource {
  final SharedPreferences sharedPreferences;
  static const String _onboardingKey = onboardingCompleted;
  LocalOnboardingDataSourceImpl(this.sharedPreferences);
  @override
  bool getOnboardingCompleted() {
    return sharedPreferences.getBool(_onboardingKey) ?? false;
  }

  @override
  Future<void> setOnboardingCompleted(bool value) async {
    await sharedPreferences.setBool(_onboardingKey, value);
  }
  
}