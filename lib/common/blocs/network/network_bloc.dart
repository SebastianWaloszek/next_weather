import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  static NetworkState get initialState => NetworkIsEvaluatingState();

  NetworkBloc() : super(initialState);

  @override
  Stream<NetworkState> mapEventToState(
    NetworkEvent event,
  ) async* {
    if (event is NetworkIsAvailableEvent) {
      yield NetworkAvailableState();
    } else if (event is NetworkIsEvaluatingEvent) {
      yield NetworkIsEvaluatingState();
    } else if (event is NetworkIsUnavailableEvent) {
      yield NetworkUnavailableState();
    } else if (event is UnexpectedNetworkErrorEvent) {
      yield UnexpectedNetworkErrorState();
    }
  }
}
