import 'package:dio/dio.dart';
import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_dev.dart';
import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/common/result/failure_result.dart';
import 'package:flutter_next_weather/common/result/success_result.dart';
import 'package:flutter_next_weather/data/network/http_method.dart';
import 'package:flutter_next_weather/data/network/network_info.dart';
import 'package:flutter_next_weather/data/network/managed_network_service.dart';
import 'package:flutter_next_weather/data/network/network_service_impl.dart';
import 'package:flutter_next_weather/data/network/request.dart';
import 'package:flutter_next_weather/data/network/request_exceptions.dart';
import 'package:flutter_next_weather/data/network/requests/get_weather_forecast_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../fixtures/fixture_reader.dart';

class NetworkInfoMock extends Mock implements NetworkInfo {}

class DioMock extends Mock implements Dio {}

class RequestMock extends Mock implements Request {}

abstract class Callable {
  void call() {}
}

class MockFunction extends Mock implements Callable {}

void main() {
  Environment.setCurrent(DevelopmentEnvironment());

  NetworkInfo networkInfo;
  Dio dio;
  // ignore: close_sinks

  NetworkServiceImpl networkServiceImpl;
  ManagedNetworkService managedNetworkService;

  GetWeatherForecastRequest request;
  Request otherRequest;
  Response tokenResponse;

  setUp(() {
    dio = DioMock();
    networkInfo = NetworkInfoMock();
    networkServiceImpl = NetworkServiceImpl(
      dio: dio,
    );
    managedNetworkService = ManagedNetworkService(
      networkInfo: networkInfo,
      networkService: networkServiceImpl,
    );
    otherRequest = RequestMock();
    when(otherRequest.method).thenReturn(HttpMethod.get);
    when(otherRequest.path).thenReturn('path');
    request = GetWeatherForecastRequest(638242);
    tokenResponse = Response(data: fixture('weather_forecast.json'), statusCode: 200);
    when(networkInfo.isConnected).thenAnswer((_) async => true);
  });

  test('Should add event to bloc when request succeeds & return SuccessResult', () async {
    // Build
    when(dio.request(
      any,
      options: anyNamed('options'),
      queryParameters: anyNamed('queryParameters'),
      data: anyNamed('data'),
    )).thenAnswer((_) async => tokenResponse);
    // Act
    final result = await managedNetworkService.make(request);
    // Expect
    expect(result is SuccessResult, isTrue);
  });

  test('Should return a failure result with NetworkFailure', () async {
    // Build
    when(dio.request(
      any,
      options: anyNamed('options'),
      queryParameters: anyNamed('queryParameters'),
      data: anyNamed('data'),
    )).thenThrow(ConnectionException(''));
    // Act
    final result = await managedNetworkService.make(request);
    // Expect
    expect(result is FailureResult, isTrue);
    result.fold(onFailure: (failure) => expect(failure is NetworkFailure, isTrue), onSuccess: (_) => {});
  });

  test('Should return a failure result with NetworkFailure on network not connected', () async {
    // Build
    when(networkInfo.isConnected).thenAnswer((_) async => false);
    // Act
    final result = await managedNetworkService.make(request);
    // Expect
    expect(result is FailureResult, isTrue);
    result.fold(onFailure: (failure) => expect(failure is NetworkFailure, isTrue), onSuccess: (_) => {});
  });

  test('Should return a failure result with UnexpectedFailure on Exception', () async {
    // Build
    when(dio.request(
      any,
      options: anyNamed('options'),
      queryParameters: anyNamed('queryParameters'),
      data: anyNamed('data'),
    )).thenThrow(Exception());
    // Act
    final result = await managedNetworkService.make(request);
    // Expect
    expect(result is FailureResult, isTrue);
    result.fold(onFailure: (failure) => expect(failure is UnexpectedFailure, isTrue), onSuccess: (_) => {});
  });
}
