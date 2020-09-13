import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/domain/entities/app_settings.dart';
import 'package:flutter_next_weather/common/result/result.dart';
import 'package:flutter_next_weather/data/data_sources/settings_data_source.dart';
import 'package:flutter_next_weather/domain/repositories/settings_repository.dart';
import 'package:meta/meta.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsDataSource settingsDataSource;

  SettingsRepositoryImpl({
    @required this.settingsDataSource,
  }) : assert(settingsDataSource != null);

  @override
  Future<Result<AppSettings, Failure>> loadAppSettings() {
    return settingsDataSource.getAppSettings();
  }

  @override
  Future<Result<void, Failure>> saveAppSettings(AppSettings settings) {
    return settingsDataSource.saveAppSettings(settings);
  }
}
