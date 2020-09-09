import 'package:intl/intl.dart';

mixin AppLocalizationMessages {
  String noInternetFound() => Intl.message(
        'No internet connection found',
        name: 'noInternetFound',
      );

  String unexpectedError() => Intl.message(
        'An unexpected error occured',
        name: 'unexpectedError',
      );
}
