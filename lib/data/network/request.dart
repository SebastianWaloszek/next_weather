import 'package:flutter/foundation.dart';
import 'package:flutter_next_weather/data/network/http_method.dart';

abstract class Request<T> {
  final String path;
  final HttpMethod method;
  final RequestBody body;
  final Map<String, dynamic> queryParameters;

  T createResponse(dynamic json);

  const Request({
    @required this.path,
    this.method = HttpMethod.get,
    this.body,
    this.queryParameters,
  })  : assert(path != null),
        assert(method != null);
}

abstract class RequestBody {
  Map<String, dynamic> toMap();
}
