import 'package:flutter_next_weather/domain/entities/air_pressure.dart';

class AirPressureModel extends AirPressure {
  AirPressureModel.fromJson(Map<String, dynamic> json)
      : super(
          json['air_pressure'] as double,
        );
}
