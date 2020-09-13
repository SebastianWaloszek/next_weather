import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/domain/entities/app_settings.dart';
import 'package:flutter_next_weather/common/result/result.dart';
import 'package:flutter_next_weather/domain/repositories/settings_repository.dart';
import 'package:flutter_next_weather/domain/use_cases/use_case.dart';
import 'package:meta/meta.dart';

class LoadSettings extends UseCase<AppSettings, void> {
  final SettingsRepository settingsRepository;

  LoadSettings({
    @required this.settingsRepository,
  }) : assert(settingsRepository != null);

  @override
  Future<Result<AppSettings, Failure>> call(_) {
    return settingsRepository.loadAppSettings();
  }
}
