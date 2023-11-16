library objects;

import 'package:flutter/material.dart' show Key;

final class Vocabulary {

  final Key key;

  final String word;

  final String translation;

  final String initialLanguage;

  final String translationLanguage;

  const Vocabulary(
      this.key,
      this.word,
      this.translation,
      this.initialLanguage,
      this.translationLanguage,
      );
}