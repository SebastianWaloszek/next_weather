import 'package:equatable/equatable.dart';
import 'package:flutter_next_weather/domain/entities/air_pressure.dart';
import 'package:flutter_next_weather/domain/entities/humidity.dart';
import 'package:flutter_next_weather/domain/entities/temperature.dart';
import 'package:flutter_next_weather/domain/entities/weather_state.dart';
import 'package:flutter_next_weather/domain/entities/wind_speed.dart';

abstract class Weather extends Equatable {
  final String description;
  final WeatherState state;
  final Temperature temperature;
  final AirPressure airPressure;
  final Humidity humidity;
  final WindSpeed windSpeed;

  const Weather({
    this.description,
    this.state,
    this.temperature,
    this.airPressure,
    this.humidity,
    this.windSpeed,
  });

  @override
  List<Object> get props => [
        description,
        state,
        temperature,
        airPressure,
        humidity,
        windSpeed,
      ];
}
