library views;

import 'package:bloc_implementation/bloc_implementation.dart' show BlocParent;
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';
import 'package:vocablo/objects/language.dart';

import '../blocs/home_bloc.dart';

final class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final class _HomeState extends State<Home> {
  late final HomeBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocParent.of(context);
    return Scaffold(
      appBar: _appBar,
      body: _body,
      floatingActionButton: _fab,
    );
  }

  AppBar get _appBar => AppBar(
        title: const Text('Vocablo'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
      );

  ListView get _body => ListView.builder(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        dragStartBehavior: DragStartBehavior.down,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: _bloc.languages.length,
        itemBuilder: (_, index) {
          return buildLanguageContainer(_bloc.languages[index]);
        },
      );

  ListTile buildLanguageContainer(Language language) {
    return ListTile(
      title: Text(language.name),
      subtitle: Text(
          'Contains ${language.vocabularies.then((value) => value.length.toString())} Vocabularies'),
      trailing: const Icon(Icons.arrow_forward_ios),
      isThreeLine: false,
      // TODO: add route name
      onTap: () => Navigator.pushNamed(context, ''),
    );
  }

  FloatingActionButton get _fab => FloatingActionButton(
        onPressed: () {},
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: const Icon(Icons.add),
      );
}
