import 'package:sqflite/sqflite.dart';
import 'package:vocablo/objects/language.dart';
import 'package:vocablo/objects/vocabulary.dart';

final class Storage {

  /// The current Version of Database
  static const int _databaseVersion = 1;

  /// The actual Database which contains all the Data for this App
  static Database? database;

  static void init() async {
    database = await openDatabase(
      await getDatabasesPath(),
      version: Storage._databaseVersion,
      onConfigure: (db) {},
      onCreate: (db, _) {},
    );
  }

  static Future<List<Language>> get languages async {
    final List<Map<String, Object?>> result =  await database!.query('Languages');
    final List<Language> langs = [];
    for (Map<String, Object?> map in result) {
      final String name = map['name'] as String;
      final Language lang = Language(
          name,
          await getVocabsForLanguage(name),
      );
      langs.add(lang);
    }
    return langs;
  }

  static Future<List<Vocabulary>> getVocabsForLanguage(String language) async {
    final List<Map<String, Object?>> result = await database!.query(
      'Vocabularies',
      where: 'language = ?',
      whereArgs: [language],
      orderBy: 'word'
    );
    final List<Vocabulary> vocabs = [];
    for (Map<String, Object?> map in result) {
      final Vocabulary vocab = Vocabulary(
          map['word'] as String,
          map['translation'] as String,
          map['initialLanguage'] as String,
          map['translationLanguage'] as String,
      );
      vocabs.add(vocab);
    }
    return vocabs;
  }
}