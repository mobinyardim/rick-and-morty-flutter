import 'package:rick_and_morty_flutter/models/Character.dart';
import 'package:rick_and_morty_flutter/models/result.dart';
import 'package:rick_and_morty_flutter/repositories/character/character_repository_impl.dart';

abstract class CharacterRepository {
  CharacterRepository();

  factory CharacterRepository.create() {
    return CharacterRepositoryImpl.create();
  }

  Future<Result<Character>> getAllCharacters(int page);
}
