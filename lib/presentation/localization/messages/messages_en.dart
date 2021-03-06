// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(min, max, unit) => "${min}${unit} / ${max}${unit}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appearance" : MessageLookupByLibrary.simpleMessage("Appearance"),
    "centigradeUnit" : MessageLookupByLibrary.simpleMessage("°C"),
    "darkTheme" : MessageLookupByLibrary.simpleMessage("Dark"),
    "dataSourceDisclaimer" : MessageLookupByLibrary.simpleMessage("Weather data provided by "),
    "dataSourceName" : MessageLookupByLibrary.simpleMessage("MetaWeather.com"),
    "degreeSign" : MessageLookupByLibrary.simpleMessage("°"),
    "fahrenheitUnit" : MessageLookupByLibrary.simpleMessage("°F"),
    "hectopascals" : MessageLookupByLibrary.simpleMessage("hPa"),
    "humidity" : MessageLookupByLibrary.simpleMessage("Humidity"),
    "kilometersPerHour" : MessageLookupByLibrary.simpleMessage("km/h"),
    "lightTheme" : MessageLookupByLibrary.simpleMessage("Light"),
    "milesPerHour" : MessageLookupByLibrary.simpleMessage("mph"),
    "noInternetFound" : MessageLookupByLibrary.simpleMessage("No internet connection found"),
    "percentageSign" : MessageLookupByLibrary.simpleMessage("%"),
    "pressure" : MessageLookupByLibrary.simpleMessage("Pressure"),
    "settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "speedUnits" : MessageLookupByLibrary.simpleMessage("Speed units"),
    "system" : MessageLookupByLibrary.simpleMessage("System"),
    "tapToTryAgain" : MessageLookupByLibrary.simpleMessage("Tap to try again"),
    "temperatureRange" : m0,
    "temperatureUnits" : MessageLookupByLibrary.simpleMessage("Temperature units"),
    "theme" : MessageLookupByLibrary.simpleMessage("Theme"),
    "unexpectedError" : MessageLookupByLibrary.simpleMessage("An unexpected error occured"),
    "wind" : MessageLookupByLibrary.simpleMessage("Wind")
  };
}
