library data;

import 'dart:ui' show Locale;

import 'package:string_translate/string_translate.dart'
    show StandardTranslations;

const Map<String, Map<Locale, String>> _translations = {
  '': {},
};

Map<String, Map<Locale, String>> get translations {
  Map<String, Map<Locale, String>> map = Map.from(_translations);
  map.addAll(StandardTranslations.all);
  return map;
}
