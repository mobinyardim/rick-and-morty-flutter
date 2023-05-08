import 'package:rick_and_morty_flutter/models/PagedData.dart';
import 'package:rick_and_morty_flutter/utils/character_faker.dart';

import '../../models/Character.dart';

abstract class HomeState {
  abstract final List<Character?> characters;
  abstract final Info? lastPageInfo;
}

class HomeInitial extends HomeState {
  @override
  List<Character?> get characters => fakeNullCharacterList;

  @override
  final Info? lastPageInfo = null;
}

class HomeLoadPage extends HomeState {
  @override
  final List<Character?> characters;

  @override
  final Info? lastPageInfo;

  HomeLoadPage({required this.characters, this.lastPageInfo}) : super();
}

class HomeLoadPageError extends HomeState {
  @override
  final List<Character?> characters;

  @override
  final Info? lastPageInfo;

  final Error error;

  HomeLoadPageError(
      {required this.characters, this.lastPageInfo, required this.error})
      : super();
}

class HomeIdle extends HomeState {
  @override
  final List<Character?> characters;

  @override
  final Info lastPageInfo;

  HomeIdle({required this.characters, required this.lastPageInfo}) : super();
}
