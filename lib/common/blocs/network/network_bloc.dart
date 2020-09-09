import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_next_weather/data/network/network_info.dart';
import 'package:meta/meta.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final NetworkInfo networkInfo;

  static NetworkState get initialState => NetworkAvailableState();

  NetworkBloc({
    @required this.networkInfo,
  })  : assert(networkInfo != null),
        super(initialState) {
    _setUpNetworkListener();
  }

  void _setUpNetworkListener() {
    networkInfo.onStatusChange.listen(
      (status) {
        // We ignore not connected state here to prevent showing an error 
        // when the device goes offline for a second. 
        // Only when a request fails we add NetworkIsUnavailableEvent.
        if (status == DataConnectionStatus.connected) {
          add(NetworkIsAvailableEvent());
        }
      },
    );
  }

  @override
  Stream<NetworkState> mapEventToState(
    NetworkEvent event,
  ) async* {
    if (event is NetworkIsAvailableEvent) {
      yield NetworkAvailableState();
    } else if (event is NetworkIsUnavailableEvent) {
      yield NetworkUnavailableState();
    } else if (event is UnexpectedNetworkErrorEvent) {
      yield UnexpectedNetworkErrorState();
    }
  }
}
