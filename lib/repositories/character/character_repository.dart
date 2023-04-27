import 'package:rick_and_morty_flutter/models/Character.dart';
import 'package:rick_and_morty_flutter/models/result.dart';
import 'package:rick_and_morty_flutter/remote_sources/character/character_remote_source.dart';
import 'package:rick_and_morty_flutter/repositories/character/character_repository_impl.dart';

abstract class CharacterRepository {

  CharacterRepository();

  static const _instanceKey = "instance";
  static final Map<String, CharacterRepository> instances =
  <String, CharacterRepository>{};

  factory CharacterRepository.create(){
    if (!instances.containsKey(_instanceKey)) {
      instances[_instanceKey] = CharacterRepositoryImpl(
          characterRemoteSource: CharacterRemoteSource.create());
    }
    return instances[_instanceKey]!;
  }

  Future<Result<Character>> getAllCharacters(int page);
}
