import 'package:flutter_next_weather/common/blocs/network/network_bloc.dart';
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
  final NetworkBloc networkBloc;

  const ManagedNetworkService({
    @required this.networkInfo,
    @required NetworkService networkService,
    @required this.networkBloc,
  })  : assert(networkInfo != null),
        assert(networkBloc != null),
        super(networkService);

  @override
  Future<Result<T, Failure>> make<T>(Request<T> request) async {
    if (!await networkInfo.isConnected) {
      _notifyBlocNetworkIsUnavailable();
      return FailureResult<T, NetworkFailure>(NetworkFailure());
    }
    try {
      _notifyBlocNetworkIsEvaluated();
      final result = await networkService.make(request);
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
