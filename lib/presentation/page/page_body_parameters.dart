import 'package:flutter/material.dart';

abstract class PageBodyParameters {
  final BuildContext context;

  PageBodyParameters({@required this.context}) : assert(context != null);
}
