import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_dev.dart';
import 'package:flutter_next_weather/common/utils/injector.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/weather_detail.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/weather_details.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/test_data.dart';
import '../../widgets/utils/localized_material_app.dart';

void main() {
  Environment.setCurrent(DevelopmentEnvironment());
  final weather = TestData.weatherForecast.weatherPredictions.first.weather;

  setUpAll(() async {
    Injector.setup();
  });

  testWidgets('WeatherDetails should show all weather details', (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: WeatherDetails(
          weather: weather,
        ),
      ),
    );
    await tester.pumpAndSettle();

    final detailsFinder = find.byType(WeatherDetail);
    expect(detailsFinder, findsNWidgets(3));
  });
}
