import 'package:flutter/material.dart';

import '../settings_page_body.dart';

class WebSettingsPageBodyState extends SettingsPageBodyState {
  @override
  List<Widget> buildSections() => [
        buildAppearanceSection(),
      ];
}
