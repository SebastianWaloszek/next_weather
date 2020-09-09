import 'package:flutter_next_weather/domain/entities/wind_speed.dart';

class WindSpeedModel extends WindSpeed {
  WindSpeedModel.fromJson(Map<String, dynamic> json)
      : super(
          json['wind_speed'],
        );
}
