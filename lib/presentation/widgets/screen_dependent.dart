import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/theme/device.dart';

class ScreenDependent extends StatelessWidget {
  final Widget wide;
  final Widget narrow;

  const ScreenDependent({
    Key key,
    @required this.wide,
    @required this.narrow,
  })  : assert(wide != null),
        assert(narrow != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Device.isWidescreen(context)) {
      return wide;
    } else {
      return narrow;
    }
  }
} 
