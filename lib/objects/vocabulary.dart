library objects;

import 'package:vocablo/objects/language.dart';

final class Vocabulary {
  final String word;

  final String translation;

  final Language initialLanguage;

  final Language translationLanguage;

  const Vocabulary(this.word, this.translation, this.initialLanguage,
      this.translationLanguage);
}