import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';
import 'package:package_info/package_info.dart';

class AppVersionLabel extends StatelessWidget {
  const AppVersionLabel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final info = snapshot.data as PackageInfo;
          return _buildVersionText(context, info);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildVersionText(BuildContext context, PackageInfo info) {
    return Text(
      AppLocalizations.of(context).appVersion(info.version),
      textAlign: TextAlign.start,
      style: AppTextStyles.subtitle1(context, color: AppColors.secondaryContent(context)),
    );
  }
}
