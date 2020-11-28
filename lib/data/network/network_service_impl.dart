import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_next_weather/data/network/http_method.dart';
import 'package:flutter_next_weather/data/network/network_service.dart';
import 'package:flutter_next_weather/data/network/request.dart';
import 'package:flutter_next_weather/data/network/request_exceptions.dart';

class NetworkServiceImpl implements NetworkService {
  final Dio dio;

  const NetworkServiceImpl({
    @required this.dio,
  }) : assert(dio != null);

  @override
  Future<dynamic> make<T>(Request<T> request) async {
    try {
      final response = await dio.request(
        request.path,
        options: Options(
          method: request.method.getMethodString(),
        ),
        queryParameters: request.queryParameters,
        data: request.body?.toMap(),
      );
      return _handleResponse<T>(request, response);
    } on DioError catch (error) {
      _handleError(error);
    }
  }

  Future<T> _handleResponse<T>(Request<T> request, Response response) async {
    if (_requestSuccessful(response.statusCode)) {
      return request.createResponse(response.data);
    }
    throw RequestException.fromStatusCode(response.statusCode, response.statusMessage);
  }

  void _handleError(DioError error) {
    if (error.type == DioErrorType.CONNECT_TIMEOUT) {
      throw ConnectionException(error.message);
    } else {
      throw RequestException.fromStatusCode(error.response?.statusCode, error.message);
    }
  }

  bool _requestSuccessful(int statusCode) => statusCode >= 200 && statusCode < 300;
}
