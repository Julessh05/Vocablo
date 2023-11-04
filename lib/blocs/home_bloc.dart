library blocs;

import 'dart:collection' show UnmodifiableListView;

import 'package:bloc_implementation/bloc_implementation.dart' show Bloc;
import 'package:vocablo/objects/language.dart';

class HomeBloc extends Bloc {

  List<Language> _languages = [];

  UnmodifiableListView<Language> get languages => UnmodifiableListView(_languages);

  @override
  void dispose() {}
}