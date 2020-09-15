import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/extensions/speed_unit_ui_extensions.dart';
import 'package:flutter_next_weather/presentation/extensions/temperature_unit_ui_extensions.dart';
import 'package:flutter_next_weather/presentation/extensions/theme_mode_ui_extensions.dart';
import 'package:flutter_next_weather/domain/entities/speed_unit.dart';
import 'package:flutter_next_weather/domain/entities/temperature_unit.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_page_keys.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';

import '../settings_row.dart';
import '../settings_section.dart';

class AppearanceSettingsSection extends StatelessWidget {
  final ThemeMode themeMode;
  final TemperatureUnit temperatureUnit;
  final SpeedUnit windSpeedUnit;

  final void Function() onThemeRowSelected;
  final void Function() ontemperatureUnitRowSelected;
  final void Function() onWindSpeedUnitRowSelected;

  final EdgeInsets margin;

  const AppearanceSettingsSection({
    Key key,
    @required this.themeMode,
    @required this.temperatureUnit,
    @required this.windSpeedUnit,
    @required this.onThemeRowSelected,
    @required this.ontemperatureUnitRowSelected,
    @required this.onWindSpeedUnitRowSelected,
    this.margin,
  })  : assert(themeMode != null),
        assert(temperatureUnit != null),
        assert(windSpeedUnit != null),
        assert(onThemeRowSelected != null),
        assert(ontemperatureUnitRowSelected != null),
        assert(onWindSpeedUnitRowSelected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: SettingsSection(
        title: AppLocalizations.of(context).appearance(),
        rows: [
          _buildThemeRow(context),
          _buildTemperatureUnitRow(context),
          _buildWindSpeedUnitRow(context),
        ],
      ),
    );
  }

  SettingsRow _buildThemeRow(BuildContext context) {
    return SettingsRow(
      key: const Key(SettingsPageKeys.themeSettingsRow),
      leading: Icon(Icons.wb_sunny, color: AppColors.secondaryContent(context)),
      title: AppLocalizations.of(context).theme(),
      trailing: Text(
        themeMode.getDescription(context),
        style: AppTextStyles.body2(context, color: AppColors.secondaryContent(context)),
      ),
      onSelected: onThemeRowSelected,
    );
  }

  SettingsRow _buildTemperatureUnitRow(BuildContext context) {
    return SettingsRow(
      key: const Key(SettingsPageKeys.temperatureUnitSettingsRow),
      leading: Icon(Icons.thermostat_outlined, color: AppColors.secondaryContent(context)),
      title: AppLocalizations.of(context).temperatureUnits(),
      trailing: Text(
        temperatureUnit.getDescription(context),
        style: AppTextStyles.body2(context, color: AppColors.secondaryContent(context)),
      ),
      onSelected: ontemperatureUnitRowSelected,
    );
  }

  SettingsRow _buildWindSpeedUnitRow(BuildContext context) {
    return SettingsRow(
      key: const Key(SettingsPageKeys.windSpeedUnitSettingsRow),
      leading: Icon(Icons.speed, color: AppColors.secondaryContent(context)),
      title: AppLocalizations.of(context).speedUnits(),
      trailing: Text(
        windSpeedUnit.getDescription(context),
        style: AppTextStyles.body2(context, color: AppColors.secondaryContent(context)),
      ),
      onSelected: onWindSpeedUnitRowSelected,
    );
  }
}
