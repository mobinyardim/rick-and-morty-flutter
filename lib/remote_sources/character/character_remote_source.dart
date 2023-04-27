import 'package:rick_and_morty_flutter/remote_sources/character/character_remote_source_impl.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/character_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/response_dto.dart';

abstract class CharacterRemoteSource {
  CharacterRemoteSource();

  static const _instanceKey = "instance";
  static final Map<String, CharacterRemoteSource> instances =
      <String, CharacterRemoteSource>{};

  factory CharacterRemoteSource.create() {
    if (!instances.containsKey(_instanceKey)) {
      instances[_instanceKey] = CharacterRemoteSourceImpl();
    }
    return instances[_instanceKey]!;
  }

  Future<ResponseDto<CharacterDto>> getAll();
}
