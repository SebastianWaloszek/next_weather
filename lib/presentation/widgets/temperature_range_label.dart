import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/temperature.dart';
import 'package:flutter_next_weather/presentation/extensions/temperature_unit_ui_extensions.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';
import 'package:flutter_next_weather/presentation/mixins/global_settings.dart';

class TemperatureRangeLabel extends StatelessWidget with GlobalSettings {
  final Temperature temperature;
  final EdgeInsets margin;

  final TextStyle textStyle;

  const TemperatureRangeLabel({
    Key key,
    @required this.temperature,
    @required this.textStyle,
    this.margin,
  })  : assert(temperature != null),
        assert(textStyle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: _buildText(context),
    );
  }

  Widget _buildText(BuildContext context) {
    return settingsBuilder(
      childBuilder: (settings) {
        return Text(
          AppLocalizations.of(context).temperatureRange(
            settings.temperatureUnit.getValueFromCertigrade(temperature.min),
            settings.temperatureUnit.getValueFromCertigrade(temperature.max),
            AppLocalizations.of(context).degreeSign(),
          ),
          style: textStyle,
        );
      },
    );
  }
}
