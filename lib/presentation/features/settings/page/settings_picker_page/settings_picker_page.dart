import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_page_arguments.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_page_body.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_page_parameters.dart';

class SettingsPickerPage extends StatefulWidget {
  static const routeName = '/settingsPicker';
  final SettingsPickerPageArguments arguments;
  final Function() hideSideView;

  const SettingsPickerPage({
    Key key,
    this.arguments,
    this.hideSideView,
  }) : super(key: key);

  @override
  _SettingsPickerPageState createState() => _SettingsPickerPageState();
}

class _SettingsPickerPageState extends State<SettingsPickerPage> {
  SettingsPickerPageArguments get arguments =>
      widget.arguments ?? ModalRoute.of(context).settings.arguments as SettingsPickerPageArguments;

  @override
  Widget build(BuildContext context) {
    return SettingsPickerPageBody(
      SettingsPickerPageParameters(
        context,
        pageTitle: arguments.pageTitle,
        initialSelectedOption: arguments.initialOption,
        options: arguments.options,
        onOptionSelected: arguments.onOptionSelected,
        settingsBloc: arguments.bloc,
        hideSideView: widget.hideSideView,
      ),
    );
  }
}
