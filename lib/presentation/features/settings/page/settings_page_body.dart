import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_page_body_parameters.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_page_keys.dart';
import 'package:flutter_next_weather/presentation/features/settings/widgets/app_version_label.dart';
import 'package:flutter_next_weather/presentation/features/settings/widgets/data_source_disclaimer_label.dart';
import 'package:flutter_next_weather/presentation/features/settings/widgets/section/appearance_settings_section.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';
import 'package:flutter_next_weather/presentation/page/page_body.dart';
import 'package:flutter_next_weather/presentation/page/scrollable_page_body_state.dart';
import 'package:flutter_next_weather/presentation/widgets/app_theme_constants.dart';
import 'package:flutter_next_weather/presentation/widgets/header.dart';

import 'states/mobile_settings_page_body_state.dart';
import 'states/web_settings_page_body_state.dart';

class SettingsPageBody extends PageBody<SettingsPageBodyParameters> {
  const SettingsPageBody(SettingsPageBodyParameters parameters) : super(parameters);

  @override
  State<SettingsPageBody> createMobileState() => MobileSettingsPageBodyState();

  @override
  State<SettingsPageBody> createWebState() => WebSettingsPageBodyState();
}

abstract class SettingsPageBodyState extends ScrollablePageBodyState<SettingsPageBody> {
  SettingsPageBodyParameters get parameters => widget.parameters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key(SettingsPageKeys.scaffold),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Header(
      backButtonKey: const Key(SettingsPageKeys.backButton),
      title: AppLocalizations.of(context).settings(),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: _buildScrollContent(),
    );
  }

  List<Widget> buildSections();

  Widget _buildScrollContent() {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: buildSections(),
      ),
    );
  }

  Widget buildAppearanceSection() {
    return AppearanceSettingsSection(
      margin: const EdgeInsets.only(top: 30),
      themeMode: parameters.settings.themeMode,
      temperatureUnit: parameters.settings.temperatureUnit,
      windSpeedUnit: parameters.settings.windSpeedUnit,
      onThemeRowSelected: parameters.showPickerForTheme,
      ontemperatureUnitRowSelected: parameters.showPickerForTemperatureUnits,
      onWindSpeedUnitRowSelected: parameters.showPickerForWindSpeedUnits,
    );
  }

  Widget buildDataSourceDisclaimerLabel() {
    return const Center(
      child: DataSourceDisclaimerLabel(
        margin: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: AppThemeConstants.horizontalPagePadding,
        ),
      ),
    );
  }

  Widget buildAppVersionLabel() {
    return Container(
      margin: const EdgeInsets.only(
        right: AppThemeConstants.horizontalPagePadding,
        top: 20,
      ),
      child: const AppVersionLabel(),
    );
  }
}
