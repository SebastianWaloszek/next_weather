import 'package:equatable/equatable.dart';

import 'package:flutter_next_weather/domain/entities/weather_type.dart';

class WeatherState extends Equatable {
  final String description;
  final WeatherType type;
  final String imageUrl;

  const WeatherState({
    this.description,
    this.type,
    this.imageUrl,
  }) : assert(description != null || type != null || imageUrl != null);

  @override
  List<Object> get props => [
        description,
        type,
        imageUrl,
      ];
}
