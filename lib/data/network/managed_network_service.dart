import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/common/result/failure_result.dart';
import 'package:flutter_next_weather/common/result/result.dart';
import 'package:flutter_next_weather/common/result/success_result.dart';
import 'package:flutter_next_weather/data/network/network_service.dart';
import 'package:flutter_next_weather/data/network/network_service_decorator.dart';
import 'package:flutter_next_weather/data/network/request.dart';
import 'package:flutter_next_weather/data/network/request_exceptions.dart';
import 'package:meta/meta.dart';
import 'network_info.dart';

class ManagedNetworkService extends NetworkServiceDecorator {
  final NetworkInfo networkInfo;

  const ManagedNetworkService({
    @required this.networkInfo,
    @required NetworkService networkService,
  })  : assert(networkInfo != null),
        super(networkService);

  @override
  Future<Result<T, Failure>> make<T>(Request<T> request) async {
    if (!await networkInfo.isConnected) {
      return FailureResult<T, NetworkFailure>(NetworkFailure());
    }
    try {
      final result = await networkService.make(request);
      return SuccessResult(result as T);
    } on ConnectionException {
      return FailureResult<T, NetworkFailure>(NetworkFailure());
    } on Exception {
      return FailureResult<T, UnexpectedFailure>(UnexpectedFailure());
    }
  }
}
