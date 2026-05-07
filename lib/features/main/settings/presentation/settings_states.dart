sealed class SettingsStates {}

class SettingsInitial extends SettingsStates {}

class SettingsLoading extends SettingsStates {}

class SettingsSuccess extends SettingsStates {}

class SettingsError extends SettingsStates {
  final String message;
  SettingsError(this.message);
}