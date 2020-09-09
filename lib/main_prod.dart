import 'package:flutter/widgets.dart';
import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_prod.dart';
import 'package:flutter_next_weather/common/utils/injector.dart';
import 'package:flutter_next_weather/presentation/app.dart';

void main() {
  Environment.setCurrent(ProductionEnvironment());
  Injector.setup();
  runApp(MyApp());
}
