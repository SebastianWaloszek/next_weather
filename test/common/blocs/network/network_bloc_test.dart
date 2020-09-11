import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_next_weather/common/blocs/network/network_bloc.dart';
import 'package:flutter_next_weather/data/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class NetworkInfoMock extends Mock implements NetworkInfo {}

void main() {
  // ignore: close_sinks
  NetworkBloc networkBloc = NetworkBloc();

  setUp(() {
    networkBloc = NetworkBloc();
  });

  blocTest(
    'Should emit correct states when network becomes unavailable',
    build: () => networkBloc,
    act: (bloc) async => bloc.add(NetworkIsUnavailableEvent()),
    expect: [
      NetworkUnavailableState(),
    ],
  );

  blocTest(
    'Should emit correct states when network is being evaluated',
    build: () => networkBloc,
    act: (bloc) async => bloc.add(NetworkIsEvaluatingEvent()),
    expect: [
      NetworkIsEvaluatingState(),
    ],
  );

  blocTest(
    'Should emit correct states when a unexpected network error occurs',
    build: () => networkBloc,
    act: (bloc) async => bloc.add(UnexpectedNetworkErrorEvent()),
    expect: [
      UnexpectedNetworkErrorState(),
    ],
  );

  blocTest(
    'Should emit correct states when network becomes available after being unavailable',
    build: () => networkBloc,
    act: (bloc) async {
      bloc.add(NetworkIsUnavailableEvent());
      return bloc.add(NetworkIsAvailableEvent());
    },
    expect: [
      NetworkUnavailableState(),
      NetworkAvailableState(),
    ],
  );

  blocTest(
    'Should emit correct states when network becomes available after an unexpected error',
    build: () => networkBloc,
    act: (bloc) async {
      bloc.add(UnexpectedNetworkErrorEvent());
      return bloc.add(NetworkIsAvailableEvent());
    },
    expect: [
      UnexpectedNetworkErrorState(),
      NetworkAvailableState(),
    ],
  );
}
