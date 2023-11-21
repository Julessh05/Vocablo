library storage;

import 'package:flutter/material.dart' show Key;

final class VocabularyQuery {
  final Key key;

  final String name;

  final String languageFrom;

  final String languageTo;

  final int vocCount;

  final bool bidirectional;

  VocabularyQuery(this.key, this.name, this.languageFrom, this.languageTo,
      this.vocCount, this.bidirectional);
}