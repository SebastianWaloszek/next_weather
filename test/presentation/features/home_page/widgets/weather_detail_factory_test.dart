import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_dev.dart';
import 'package:flutter_next_weather/domain/entities/speed_unit.dart';
import 'package:flutter_next_weather/presentation/extensions/speed_unit_ui_extensions.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/weather_detail.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/weather_detail_factory.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/test_data.dart';
import '../../widgets/utils/localized_material_app.dart';

void main() {
  Environment.setCurrent(DevelopmentEnvironment());
  final weather = TestData.weatherForecast.weatherPredictions.first.weather;
  const windSpeedUnit = SpeedUnit.kilometersPerHour;

  testWidgets('WeatherDetailFactory should return all weather details with appropriate values',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: Builder(builder: (context) {
          return Row(
            children: WeatherDetailFactory.getWeatherDetails(
              context,
              weather: weather,
              windSpeedUnit: windSpeedUnit,
            ),
          );
        }),
      ),
    );
    await tester.pumpAndSettle();

    final detailsFinder = find.byType(WeatherDetail);
    final weatherDetails = List<WeatherDetail>.of(tester.widgetList(detailsFinder));

    expect(weatherDetails[0].value, weather.humidity.value);
    expect(weatherDetails[1].value, weather.airPressure.value.floor());
    expect(
      weatherDetails[2].value,
      windSpeedUnit.getValueFromMilesPerHour(weather.windSpeed.value),
    );
  });
}
