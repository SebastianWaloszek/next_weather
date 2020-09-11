import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/common/parameters/app_settings.dart';
import 'package:flutter_next_weather/common/result/result.dart';

abstract class SettingsDataSource {
  Future<Result<AppSettings, Failure>> getAppSettings();
  Future<Result<void, Failure>> saveAppSettings(AppSettings settings);
}
