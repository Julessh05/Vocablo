library objects;

import 'vocabulary.dart';

final class Language {

  /// The Name of the this Language
  final String name;

  /// All the vocabularies stored in here
  final List<Vocabulary> vocabularies;

  const Language(this.name, this.vocabularies);
}