import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/theme/app_images.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';

class NetworkErrorMessage extends StatelessWidget {
  static const double imageHeight = 113;

  final title;
  final subtitle;

  final AssetImage image;

  const NetworkErrorMessage({
    Key key,
    this.title,
    this.subtitle,
    this.image,
  })  : assert(title != null || subtitle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildImage(context),
        _buildTextColumn(context),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return Image(
      height: imageHeight,
      image: image ?? AppImages.networkError(context),
    );
  }

  Widget _buildTextColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildText(
          context,
          text: title,
          margin: const EdgeInsets.only(top: 20),
          textStyle: AppTextStyles.headline4(
            context,
            color: AppColors.secondaryContent(context),
          ),
        ),
        _buildText(
          context,
          text: subtitle,
          margin: const EdgeInsets.only(top: 10),
          textStyle: AppTextStyles.subtitle1(
            context,
            color: AppColors.secondaryContent(context),
          ),
        ),
      ],
    );
  }

  Widget _buildText(BuildContext context, {@required String text, EdgeInsets margin, TextStyle textStyle}) {
    return Container(
      width: double.maxFinite,
      margin: margin,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle,
      ),
    );
  }
}
