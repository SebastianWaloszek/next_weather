import 'package:dio/dio.dart';
import 'package:flutter_next_weather/common/blocs/network/network_bloc.dart';
import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/common/result/failure_result.dart';
import 'package:flutter_next_weather/common/result/result.dart';
import 'package:flutter_next_weather/common/result/success_result.dart';
import 'package:flutter_next_weather/data/network/network_service.dart';
import 'package:flutter_next_weather/data/network/request.dart';
import 'package:flutter_next_weather/data/network/request_exceptions.dart';
import 'package:meta/meta.dart';
import 'network_info.dart';

class NetworkServiceImpl extends NetworkService {
  final NetworkInfo networkInfo;
  final NetworkBloc networkBloc;

  NetworkServiceImpl({
    @required this.networkInfo,
    @required Dio dio,
    @required this.networkBloc,
  })  : assert(networkInfo != null),
        assert(networkBloc != null),
        super(dio: dio);

  @override
  Future<Result<T, Failure>> make<T>(Request<T> request) async {
    Future<dynamic> requestFunction() => super.make(request);
    return _perform(requestFunction, request);
  }

  Future<Result<T, Failure>> _perform<T>(Function requestFunction, Request<T> request) async {
    if (!await networkInfo.isConnected) {
      _notifyBlocNetworkIsUnavailable();
      return FailureResult<T, NetworkFailure>(NetworkFailure());
    }
    try {
      _notifyBlocNetworkIsEvaluated();
      final result = await requestFunction.call();
      _notifyBlocNetworkIsAvailable();
      return SuccessResult(result as T);
    } on ConnectionException {
      _notifyBlocNetworkIsUnavailable();
      return FailureResult<T, NetworkFailure>(NetworkFailure());
    } on Exception {
      _notifyBlocOfUnexpectedError();
      return FailureResult<T, UnexpectedFailure>(UnexpectedFailure());
    }
  }

  void _notifyBlocNetworkIsEvaluated() {
    networkBloc.add(NetworkIsEvaluatingEvent());
  }

  void _notifyBlocNetworkIsAvailable() {
    networkBloc.add(NetworkIsAvailableEvent());
  }

  void _notifyBlocNetworkIsUnavailable() {
    networkBloc.add(NetworkIsUnavailableEvent());
  }

  void _notifyBlocOfUnexpectedError() {
    networkBloc.add(UnexpectedNetworkErrorEvent());
  }
}
