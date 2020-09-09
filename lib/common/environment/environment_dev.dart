import 'environment.dart';

class DevelopmentEnvironment implements Environment {
  @override
  // TODO: implement baseUrl
  String get baseUrl => throw UnimplementedError();

  @override
  bool get useMockData => false;
}
