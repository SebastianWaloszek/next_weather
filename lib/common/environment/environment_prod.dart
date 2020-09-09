import 'environment.dart';

class ProductionEnvironment implements Environment {
  @override
  String get baseUrl => null;

  @override
  bool get useMockData => false;
}
