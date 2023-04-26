import 'package:rick_and_morty_flutter/remote_sources/dto/character_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/json_parser/parsers.dart';
import 'package:rick_and_morty_flutter/remote_sources/json_parser/base_json_parser.dart';
import 'package:rick_and_morty_flutter/utils/logger.dart';

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
        image: json["image"],
        gender: json["gender"],
        episodes: List.from(json['episode']),
        location: locationParser.fromJson(json["location"]),
        url: json["url"],
        created: json["created"],
      );
    } catch (e, stackTrace) {
      logger.e(e);
      logger.d(stackTrace);
      throw Exception("Json convert exception in character parser,$e");
    }
  }

  @override
  String toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
