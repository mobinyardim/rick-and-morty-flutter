import 'package:rick_and_morty_flutter/remote_sources/dto/character_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/json_parser/Parsers.dart';
import 'package:rick_and_morty_flutter/remote_sources/json_parser/base_json_parser.dart';

class CharacterParser extends BaseJsonParser<CharacterDto> {
  const CharacterParser() : super();

  @override
  CharacterDto fromJson(Map<String, dynamic> json) {
    try {
      return CharacterDto(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        episodes: json['episode'] as List<String>,
        location: locationParser.fromJson(json["location"]),
        url: json["url"],
        created: json["created"],
      );
    } catch (e) {
      throw Exception("Json convert exception");
    }
  }

  @override
  String toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
