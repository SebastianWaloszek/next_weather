part of 'network_bloc.dart';

@immutable
abstract class NetworkState extends Equatable {
  @override
  List<Object> get props => [];
}

class NetworkAvailableState extends NetworkState {}

class NetworkIsEvaluatingState extends NetworkState {}

class NetworkUnavailableState extends NetworkState {}

class UnexpectedNetworkErrorState extends NetworkState {}
