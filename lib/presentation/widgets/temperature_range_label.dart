import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/temperature.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';

class TemperatureRangeLabel extends StatelessWidget {
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
    return Text(
      AppLocalizations.of(context).temperatureRange(
        min: temperature.min,
        max: temperature.max,
        unit: AppLocalizations.of(context).degreeSign(),
      ),
      style: textStyle,
    );
  }
}
