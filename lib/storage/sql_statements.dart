library storage;

/// Contains all SQL Statements
final class SQLStatements {

  /// Statement to create the Language Table
  static const String createTableLang = 'CREATE TABLE Language (langid TEXT PRIMARY KEY, name TEXT)';

  /// Statement to create the Vocabulary Table
  static const String createTableVocs = 'CREATE TABLE Vocabularies (vocid TEXT PRIMARY KEY, word TEXT, translation TEXT, initialLanguage TEXT, translationLanguage TEXT)';

  static const String createTableQuery = 'CREATE TABLE Query (queryid TEXT PRIMARY KEY, name TEXT, languageFrom TEXT, languageTo TEXT, vocCount INT, bidirectional, BOOL)';

  static const String createTableList = 'CREATE TABLE List (listid TEXT PRIMARY KEY, name TEXT)';

  static const String createTableListItems = 'CREATE TABLE ListItem (listid TEXT, vocid TEXT, PRIMARY KEY (listid, vocid))';

  static const String createTableListQuery = 'CREATE TABLE ListQuery (queryid TEXT, listid TEXT, PRIMARY KEY (queryid, listid))';
}