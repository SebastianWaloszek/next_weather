import 'environment.dart';

class DevelopmentEnvironment implements Environment {
  @override
  String get baseUrl => 'https://www.metaweather.com/';

  @override
  bool get useMockData => false;

  @override
  String get dataSourceDisclaimerUrl => 'https://www.metaweather.com';
}
