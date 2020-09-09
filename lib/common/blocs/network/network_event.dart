part of 'network_bloc.dart';

@immutable
abstract class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

class NetworkIsAvailableEvent extends NetworkEvent {}

class NetworkIsUnavailableEvent extends NetworkEvent {}

class UnexpectedNetworkErrorEvent extends NetworkEvent {}
