import 'environment.dart';

class ProductionEnvironment implements Environment {
  @override
  String get baseUrl => 'https://www.metaweather.com/api/';

  @override
  bool get useMockData => false;
}
