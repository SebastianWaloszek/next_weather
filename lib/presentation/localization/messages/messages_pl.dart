// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
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
  String get localeName => 'pl';

  static m0(min, max, unit) => "${min}${unit} / ${max}${unit}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appearance" : MessageLookupByLibrary.simpleMessage("Wygląd"),
    "centigradeUnit" : MessageLookupByLibrary.simpleMessage("°C"),
    "darkTheme" : MessageLookupByLibrary.simpleMessage("Ciemny"),
    "dataSourceDisclaimer" : MessageLookupByLibrary.simpleMessage("Dane pogodowe dostarczone przez "),
    "dataSourceName" : MessageLookupByLibrary.simpleMessage("MetaWeather.com"),
    "degreeSign" : MessageLookupByLibrary.simpleMessage("°"),
    "fahrenheitUnit" : MessageLookupByLibrary.simpleMessage("°F"),
    "hectopascals" : MessageLookupByLibrary.simpleMessage("hPa"),
    "humidity" : MessageLookupByLibrary.simpleMessage("Wilgotność"),
    "kilometersPerHour" : MessageLookupByLibrary.simpleMessage("km/h"),
    "lightTheme" : MessageLookupByLibrary.simpleMessage("Jasny"),
    "milesPerHour" : MessageLookupByLibrary.simpleMessage("mph"),
    "noInternetFound" : MessageLookupByLibrary.simpleMessage("Nie znaleziono połączenia internetowego"),
    "percentageSign" : MessageLookupByLibrary.simpleMessage("%"),
    "pressure" : MessageLookupByLibrary.simpleMessage("Ciśnienie"),
    "settings" : MessageLookupByLibrary.simpleMessage("Ustawienia"),
    "speedUnits" : MessageLookupByLibrary.simpleMessage("Jednostka prędkości"),
    "system" : MessageLookupByLibrary.simpleMessage("Systemowy"),
    "tapToTryAgain" : MessageLookupByLibrary.simpleMessage("Naciśnij, by spróbować ponownie"),
    "temperatureRange" : m0,
    "temperatureUnits" : MessageLookupByLibrary.simpleMessage("Jednostka temperatury"),
    "theme" : MessageLookupByLibrary.simpleMessage("Motyw"),
    "unexpectedError" : MessageLookupByLibrary.simpleMessage("Wystąpił nieoczekiwany błąd"),
    "wind" : MessageLookupByLibrary.simpleMessage("Wiatr")
  };
}
