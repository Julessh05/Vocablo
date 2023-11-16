import 'package:flutter/material.dart' show Key;
import 'package:sqflite/sqflite.dart';
import 'package:vocablo/objects/language.dart';
import 'package:vocablo/objects/vocabulary.dart';
import 'package:vocablo/objects/vocabulary_list.dart';
import 'package:vocablo/storage/sql_statements.dart';

final class Storage {
  /// The current Version of Database
  static const int _databaseVersion = 1;

  /// The actual Database which contains all the Data for this App
  static Database? database;

  static void init() async {
    database = await openDatabase(await getDatabasesPath(),
        version: Storage._databaseVersion,
        onConfigure: (db) {},
        onCreate: (db, _) => _onCreate(db));
  }

  static void _onCreate(Database db) {
    db.execute(SQLStatements.createTableLang);
    db.execute(SQLStatements.createTableVocs);
    db.execute(SQLStatements.createTableList);
    db.execute(SQLStatements.createTableQuery);
    db.execute(SQLStatements.createTableListItems);
    db.execute(SQLStatements.createTableListQuery);
  }

  static Future<List<Language>> get languages async {
    final List<Map<String, Object?>> result =
        await database!.query('Languages');
    final List<Language> langs = [];
    for (Map<String, Object?> map in result) {
      final Language lang = Language(
        Key(map['langid'] as String),
        map['name'] as String,
      );
      langs.add(lang);
    }
    return langs;
  }

  static Future<List<Vocabulary>> getVocabsForLanguageCombination(
      String language1, String language2) async {
    final List<Map<String, Object?>> result = await database!.query(
      'Vocabularies',
      // Get all Vocabulary for this Language combination in both directions
      where:
          'initialLanguage = ? AND translationLanguage = ? OR initialLanguage = ? AND translationLanguage = ?',
      whereArgs: [language1, language2, language2, language1],
      orderBy: 'word',
    );
    final List<Vocabulary> vocabs = [];
    for (Map<String, Object?> map in result) {
      final Vocabulary vocab = Vocabulary(
        Key(map['vocid'] as String),
        map['word'] as String,
        map['translation'] as String,
        map['initialLanguage'] as String,
        map['translationLanguage'] as String,
      );
      vocabs.add(vocab);
    }
    return vocabs;
  }

  static Future<List<VocabularyList>> get lists async {
    final List<Map<String, Object?>> result = await database!.query('List');
    final List<VocabularyList> list = [];
    for (Map<String, Object?> map in result) {
      final VocabularyList vocList = VocabularyList(
        Key(map['listid'] as String),
        map['name'] as String,
      );
      list.add(vocList);
    }
    return list;
  }
}