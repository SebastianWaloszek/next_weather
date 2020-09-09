import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/location.dart';
import 'package:flutter_next_weather/domain/entities/weather_prediction.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';
import 'package:flutter_next_weather/presentation/widgets/animated_unit_number_text.dart';
import 'package:flutter_next_weather/presentation/widgets/button.dart';
import 'package:flutter_next_weather/presentation/widgets/rectangular_network_image.dart';

class WeatherSummary extends StatelessWidget {
  final WeatherPrediction weatherPrediction;
  final Location location;

  final EdgeInsets margin;

  final void Function() onLocationTapped;

  const WeatherSummary({
    Key key,
    @required this.weatherPrediction,
    @required this.location,
    @required this.onLocationTapped,
    this.margin,
  })  : assert(weatherPrediction != null),
        assert(location != null),
        assert(onLocationTapped != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        children: <Widget>[
          _buildLeftColumn(context),
          _buildWeatherStateImage(),
        ],
      ),
    );
  }

  Widget _buildWeatherStateImage() {
    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 215),
        child: RectangularNetworkImage(
          margin: const EdgeInsets.only(left: 25),
          imageUrl: weatherPrediction.weather.state.imageUrl,
        ),
      ),
    );
  }

  Widget _buildLeftColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildLocationButton(context),
        _buildWeatherTextDetails(context),
      ],
    );
  }

  Widget _buildLocationButton(BuildContext context) {
    return Button(
      icon: Icons.location_on_outlined,
      title: location.title,
      onTapped: onLocationTapped,
    );
  }

  Widget _buildWeatherTextDetails(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTemperatureText(context),
          _buildWeatherStateText(context),
        ],
      ),
    );
  }

  Widget _buildTemperatureText(BuildContext context) {
    return AnimatedUnitNumberText(
      value: weatherPrediction.weather.temperature.average,
      valueUnit: AppLocalizations.of(context).degreeSign(),
      valueTextStyle: AppTextStyles.headline1(context),
      valueUnitTextStyle: AppTextStyles.headline2(context),
      unitLeftMargin: 0,
    );
  }

  Widget _buildWeatherStateText(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Text(
        weatherPrediction.weather.state.description,
        style: AppTextStyles.body2(context),
      ),
    );
  }
}
