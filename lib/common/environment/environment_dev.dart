import 'environment.dart';

class DevelopmentEnvironment implements Environment {
  @override
  String get baseUrl => 'https://www.metaweather.com/';

  @override
  String get dataSourceDisclaimerUrl => 'https://www.metaweather.com';
}
