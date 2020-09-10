import 'package:flutter/material.dart';

abstract class Device {
  static double height(BuildContext context) => MediaQuery.of(context).size.height;
  static double width(BuildContext context) => MediaQuery.of(context).size.width;
  static bool isWidescreen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width > size.height;
  }
}
