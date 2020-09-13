import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/data/models/app_settings_model.dart';
import 'package:flutter_next_weather/domain/entities/app_settings.dart';
import 'package:flutter_next_weather/common/result/failure_result.dart';
import 'package:flutter_next_weather/common/result/result.dart';
import 'package:flutter_next_weather/common/result/success_result.dart';
import 'package:flutter_next_weather/data/data_sources/settings_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSettingsDataSource implements SettingsDataSource {
  static const _settingsKey = 'settings';

  @override
  Future<Result<AppSettings, Failure>> getAppSettings() async {
    final failureResult = FailureResult<AppSettings, Failure>(UnexpectedFailure());
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final json = sharedPreferences.getString(_settingsKey);
      final settings = AppSettingsModel.fromJson(json);
      if (settings != null) {
        return SuccessResult<AppSettings, Failure>(settings);
      }
      return failureResult;
    } on Exception {
      return failureResult;
    }
  }

  @override
  Future<Result<void, Failure>> saveAppSettings(AppSettings settings) async {
    final failureResult = FailureResult<AppSettings, Failure>(UnexpectedFailure());
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final json = settings.toJson();
      sharedPreferences.setString(_settingsKey, json);
      return SuccessResult<void, Failure>(null);
    } on Exception {
      return failureResult;
    }
  }
}
