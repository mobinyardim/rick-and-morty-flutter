import 'package:rick_and_morty_flutter/models/PagedData.dart';
import 'package:rick_and_morty_flutter/utils/character_faker.dart';

import '../../models/Character.dart';

abstract class CharactersState {
  abstract final List<Character?> characters;
  abstract final Info? lastPageInfo;
}

class CharactersInitial extends CharactersState {
  @override
  List<Character?> get characters => fakeNullCharacterList;

  @override
  final Info? lastPageInfo = null;
}

class CharactersLoadPage extends CharactersState {
  @override
  final List<Character?> characters;

  @override
  final Info? lastPageInfo;

  CharactersLoadPage({required this.characters, this.lastPageInfo}) : super();
}

class CharactersLoadPageError extends CharactersState {
  @override
  final List<Character?> characters;

  @override
  final Info? lastPageInfo;

  final Error error;

  CharactersLoadPageError(
      {required this.characters, this.lastPageInfo, required this.error})
      : super();
}

class CharactersIdle extends CharactersState {
  @override
  final List<Character?> characters;

  @override
  final Info lastPageInfo;

  CharactersIdle({required this.characters, required this.lastPageInfo}) : super();
}
