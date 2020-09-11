import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_option.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_page_parameters.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/states/mobile_settings_picker_page_body_state.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/states/web_settings_picker_page_body_state.dart';
import 'package:flutter_next_weather/presentation/page/page_body.dart';
import 'package:flutter_next_weather/presentation/page/scrollable_page_body_state.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';
import 'package:flutter_next_weather/presentation/widgets/app_theme_constants.dart';
import 'package:flutter_next_weather/presentation/widgets/header.dart';

class SettingsPickerPageBody extends PageBody<SettingsPickerPageParameters> {
  const SettingsPickerPageBody(SettingsPickerPageParameters parameters) : super(parameters);

  @override
  State<StatefulWidget> createMobileState() => MobileSettingsPickerPageBodyState(parameters.initialSelectedOption);

  @override
  State<StatefulWidget> createWebState() => WebSettingsPickerPageBodyState(parameters.initialSelectedOption);
}

class SettingsPickerPageBodyState extends ScrollablePageBodyState<SettingsPickerPageBody> {
  SettingsPickerPageParameters get parameters => widget.parameters;

  SettingsPickerOption selectedOption;

  SettingsPickerPageBodyState(this.selectedOption);

  void selectOption(SettingsPickerOption optionTitle) {
    setState(() {
      selectedOption = optionTitle;
    });
    parameters.onOptionSelected(selectedOption);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        buildHeader(),
        _buildScrollView(),
      ],
    );
  }

  Widget buildHeader() {
    return Header(
      title: parameters.pageTitle,
    );
  }

  Widget _buildScrollView() {
    return SingleChildScrollView(
      controller: scrollController,
      child: _buildListView(),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => buildOptionRow(parameters.options[index]),
      itemCount: parameters.options.length,
    );
  }

  Widget buildOptionRow(SettingsPickerOption option) {
    final isSelected = selectedOption == option;
    return InkWell(
      onTap: () => selectOption(option),
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: AppThemeConstants.horizontalPagePadding,
          right: AppThemeConstants.horizontalPagePadding,
          bottom: 20,
        ),
        child: Row(
          children: <Widget>[
            buildOptionRowText(option.description, isSelected: isSelected),
            if (isSelected) buildOptionRowCheck(),
          ],
        ),
      ),
    );
  }

  Expanded buildOptionRowText(String optionTitle, {bool isSelected}) {
    return Expanded(
      child: Text(
        optionTitle,
        style: AppTextStyles.body2(
          context,
          color: isSelected ? AppColors.primaryContent(context) : AppColors.secondaryContent(context),
        ),
      ),
    );
  }

  Widget buildOptionRowCheck() {
    return Icon(
      Icons.check,
      color: AppColors.active(context),
    );
  }
}
