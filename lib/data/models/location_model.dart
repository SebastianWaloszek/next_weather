import 'package:flutter_next_weather/domain/entities/location.dart';

class LocationModel extends Location {
  LocationModel.fromJson(Map<String, dynamic> json)
      : super(
          title: json['title'] as String,
        );
}
