library blocs;

import 'dart:collection' show UnmodifiableListView;

import 'package:bloc_implementation/bloc_implementation.dart' show Bloc;
import 'package:vocablo/objects/language.dart';
import 'package:vocablo/storage/storage.dart';

class HomeBloc extends Bloc {

  @override
  void init() async {
    _languages = await Storage.languages;
    super.init();
  }

  List<Language> _languages = [];

  UnmodifiableListView<Language> get languages => UnmodifiableListView(_languages);

  @override
  void dispose() {}
}