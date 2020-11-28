import 'package:flutter_next_weather/data/network/request.dart';

abstract class NetworkService {
  Future<dynamic> make<T>(Request<T> request);
}
