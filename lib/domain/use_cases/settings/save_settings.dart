import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/common/parameters/app_settings.dart';
import 'package:flutter_next_weather/common/result/result.dart';
import 'package:flutter_next_weather/domain/repositories/settings_repository.dart';
import 'package:flutter_next_weather/domain/use_cases/use_case.dart';
import 'package:meta/meta.dart';

class SaveSettings extends UseCase<void, AppSettings> {
  final SettingsRepository settingsRepository;

  SaveSettings({
    @required this.settingsRepository,
  }) : assert(settingsRepository != null);

  @override
  Future<Result<void, Failure>> call(AppSettings settings) {
    return settingsRepository.saveAppSettings(settings);
  }
}
