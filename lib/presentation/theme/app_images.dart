import 'package:flutter/material.dart';

abstract class AppImages {
  static const String _path = 'resources/graphics/images/';
  static const String _extension = 'png';

  static AssetImage _getAssetForTheme(BuildContext context, {@required String assetName}) {
    switch (Theme.of(context).brightness) {
      case Brightness.light:
        return AssetImage('$_path${assetName}_light_theme.$_extension');
      case Brightness.dark:
        return AssetImage('$_path${assetName}_dark_theme.$_extension');
    }
    throw UnsupportedError('${Theme.of(context).brightness} is not supported');
  }

  static AssetImage networkError(BuildContext context) => _getAssetForTheme(
        context,
        assetName: 'network_error',
      );
}
