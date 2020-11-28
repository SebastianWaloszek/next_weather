import 'package:flutter_next_weather/data/network/network_service.dart';
import 'package:flutter_next_weather/data/network/request.dart';

abstract class NetworkServiceDecorator implements NetworkService {
  final NetworkService networkService;

  const NetworkServiceDecorator(this.networkService);

  @override
  Future make<T>(Request<T> request) {
    return networkService.make<T>(request);
  }
}
