import 'package:rick_and_morty_flutter/models/PagedData.dart';
import 'package:rick_and_morty_flutter/utils/character_faker.dart';

import '../../models/Character.dart';

abstract class CharactersState {
  abstract final List<Character?> characters;
  abstract final Info? lastPageInfo;
  abstract final int lastPageIndex;
}

class CharactersInitial extends CharactersState {
  @override
  List<Character?> get characters => fakeNullCharacterList;

  @override
  final Info? lastPageInfo = null;

  @override
  final int lastPageIndex = 0;
}

class CharactersLoadPage extends CharactersState {
  @override
  final List<Character?> characters;

  @override
  final Info? lastPageInfo;

  @override
  final int lastPageIndex;

  CharactersLoadPage({
    required this.characters,
    required this.lastPageIndex,
    this.lastPageInfo,
  }) : super();
}

class CharactersLoadPageError extends CharactersState {
  @override
  final List<Character?> characters;

  @override
  final Info? lastPageInfo;

  final Exception error;

  @override
  final int lastPageIndex;

  CharactersLoadPageError({
    required this.characters,
    required this.lastPageIndex,
    required this.error,
    this.lastPageInfo,
  }) : super();
}

class CharactersIdle extends CharactersState {
  @override
  final List<Character?> characters;

  @override
  final Info lastPageInfo;

  @override
  final int lastPageIndex;

  CharactersIdle(
      {required this.characters,
      required this.lastPageIndex,
      required this.lastPageInfo})
      : super();
}
