import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DataSourceDisclaimerLabel extends StatelessWidget {
  final EdgeInsets margin;

  const DataSourceDisclaimerLabel({
    Key key,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            buildDisclaimerTextSpan(context),
            builDataSourceNameTextSpan(context),
          ],
        ),
      ),
    );
  }

  TextSpan buildDisclaimerTextSpan(BuildContext context) {
    return TextSpan(
      text: AppLocalizations.of(context).dataSourceDisclaimer(),
      style: AppTextStyles.subtitle1(context, color: AppColors.secondaryContent(context)),
    );
  }

  TextSpan builDataSourceNameTextSpan(BuildContext context) {
    return TextSpan(
      text: AppLocalizations.of(context).dataSourceName(),
      style: AppTextStyles.subtitle1(context, color: AppColors.active(context)),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          launch(Environment.current.dataSourceDisclaimerUrl);
        },
    );
  }
}
