// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static m0(min, max, unit) => "${min}${unit} / ${max}${unit}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appearance" : MessageLookupByLibrary.simpleMessage("Optische"),
    "centigradeUnit" : MessageLookupByLibrary.simpleMessage("°C"),
    "darkTheme" : MessageLookupByLibrary.simpleMessage("Dunkel"),
    "dataSourceDisclaimer" : MessageLookupByLibrary.simpleMessage("Wetterdaten bereitgestellt von "),
    "dataSourceName" : MessageLookupByLibrary.simpleMessage("MetaWeather.com"),
    "degreeSign" : MessageLookupByLibrary.simpleMessage("°"),
    "fahrenheitUnit" : MessageLookupByLibrary.simpleMessage("°F"),
    "hectopascals" : MessageLookupByLibrary.simpleMessage("hPa"),
    "humidity" : MessageLookupByLibrary.simpleMessage("Feuchtigkeit"),
    "kilometersPerHour" : MessageLookupByLibrary.simpleMessage("km/h"),
    "lightTheme" : MessageLookupByLibrary.simpleMessage("Hell"),
    "milesPerHour" : MessageLookupByLibrary.simpleMessage("mph"),
    "noInternetFound" : MessageLookupByLibrary.simpleMessage("Keine Internetverbindung gefunden"),
    "percentageSign" : MessageLookupByLibrary.simpleMessage("%"),
    "pressure" : MessageLookupByLibrary.simpleMessage("Luftdruck"),
    "settings" : MessageLookupByLibrary.simpleMessage("Einstellungen"),
    "speedUnits" : MessageLookupByLibrary.simpleMessage("Geschwindigkeit"),
    "system" : MessageLookupByLibrary.simpleMessage("System"),
    "tapToTryAgain" : MessageLookupByLibrary.simpleMessage("Erneut versuchen"),
    "temperatureRange" : m0,
    "temperatureUnits" : MessageLookupByLibrary.simpleMessage("Temperatur"),
    "theme" : MessageLookupByLibrary.simpleMessage("Thema"),
    "unexpectedError" : MessageLookupByLibrary.simpleMessage("Ein unerwarteter Fehler ist aufgetreten"),
    "wind" : MessageLookupByLibrary.simpleMessage("Wind")
  };
}
