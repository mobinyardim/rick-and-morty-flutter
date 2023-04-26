import 'package:rick_and_morty_flutter/models/Character.dart';
import 'package:rick_and_morty_flutter/models/result.dart';

abstract class CharacterRepository {
  const CharacterRepository();

  Future<Result<Character>> getAllCharacters(int page);
}
