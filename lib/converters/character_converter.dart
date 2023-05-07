import 'package:rick_and_morty_flutter/converters/base_converter.dart';
import 'package:rick_and_morty_flutter/converters/converters.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/character_dto.dart';

import '../models/Character.dart';

class CharacterConverter extends BaseConverter<Character, CharacterDto> {
  const CharacterConverter();

  @override
  Character toDomain(CharacterDto dto) {
    return Character(
        id: dto.id.toString(),
        name: dto.name,
        status: convertStringToCharacterStatus(dto.status),
        species: dto.species,
        gender: convertStringToGender(dto.gender),
        origin: Origin(name: ""),
        location: locationConverter.toDomain(dto.location),
        image: dto.image,
        episode: dto.episodes,
        url: dto.url);
    throw UnimplementedError();
  }

  CharacterStatus convertStringToCharacterStatus(String status) {
    var current = CharacterStatus.unknown;
    switch (status) {
      case "alive":
        {
          current = CharacterStatus.alive;
          break;
        }
      case "dead":
        {
          current = CharacterStatus.dead;
          break;
        }
    }
    return current;
  }

  Gender convertStringToGender(String status) {
    var current = Gender.unknown;
    switch (status) {
      case "female":
        {
          current = Gender.female;
          break;
        }
      case "male":
        {
          current = Gender.male;
          break;
        }
      case "genderless":
        {
          current = Gender.genderless;
          break;
        }
    }
    return current;
  }

  @override
  CharacterDto toDto(Character domain) {
    // TODO: implement toDto
    throw UnimplementedError();
  }
}
