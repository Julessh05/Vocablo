library objects;

import 'package:flutter/material.dart';
import 'package:vocablo/storage/storage.dart';

import 'preferences.dart';
import 'vocabulary.dart';

final class Language {
  final Key key;

  /// The Name of the this Language
  final String name;

  const Language(this.key, this.name);

  Future<List<Vocabulary>> get vocabularies async {
    return await Storage.getVocabsForLanguageCombination(
      name,
      Preferences.defaultLanguage.name,
    );
  }
}
