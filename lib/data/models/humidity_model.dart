import 'package:flutter_next_weather/domain/entities/humidity.dart';

class HumidityModel extends Humidity {
  HumidityModel.fromJson(Map<String, dynamic> json)
      : super(
          json['humidity'],
        );
}
