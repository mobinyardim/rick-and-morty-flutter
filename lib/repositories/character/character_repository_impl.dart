import 'package:rick_and_morty_flutter/converters/converters.dart';
import 'package:rick_and_morty_flutter/models/Character.dart';
import 'package:rick_and_morty_flutter/models/result.dart';
import 'package:rick_and_morty_flutter/repositories/character/character_repository.dart';

import '../../remote_sources/character/character_remote_source.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterRemoteSource characterRemoteSource;

  CharacterRepositoryImpl({required this.characterRemoteSource});

  @override
  Future<Result<Character>> getAllCharacters(int page) async {
    var response = await characterRemoteSource.getAll();
    return charactersResponseConverter.toDomain(response);
  }
}
