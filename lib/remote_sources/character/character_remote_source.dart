import 'package:rick_and_morty_flutter/remote_sources/character/character_remote_source_impl.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/character_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/paged_data_dto.dart';

abstract class CharacterRemoteSource {
  CharacterRemoteSource();

  factory CharacterRemoteSource.create() {
    return CharacterRemoteSourceImpl.create();
  }

  Future<PagedDataDto<CharacterDto>> getAll();
}
