import 'environment.dart';

class DevelopmentEnvironment implements Environment {
  @override
  String get baseUrl => 'https://www.metaweather.com/api/';

  @override
  bool get useMockData => false;
}
