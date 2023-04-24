import 'package:rick_and_morty_flutter/remote_sources/dto/character_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/response_dto.dart';

abstract class CharacterRemoteSource {
  Future<ResponseDto<CharacterDto>> getAll();
}
