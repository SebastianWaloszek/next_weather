import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/page/page_body_parameters.dart';

abstract class PageBody<P extends PageBodyParameters> extends StatefulWidget {
  final P parameters;

  const PageBody(this.parameters);

  State createMobileState();

  State createWebState();

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    if (kIsWeb) {
      return createWebState();
    } else {
      return createMobileState();
    }
  }
}
