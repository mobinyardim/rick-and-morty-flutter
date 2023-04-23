import 'package:rick_and_morty_flutter/remote_sources/dto/location_dto.dart';

class CharacterDto {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  LocationDto location;
  List<String> episodes;
  String url;
  String created;

  static CharacterDto fromJson(Map<String, dynamic> parsedJson) {
    try {
      return CharacterDto(
        id: parsedJson["id"],
        name: parsedJson["name"],
        status: parsedJson["status"],
        species: parsedJson["species"],
        type: parsedJson["type"],
        gender: parsedJson["gender"],
        episodes: parsedJson['episode'] as List<String>,
        location: LocationDto.fromJson(parsedJson["location"]),
        url: parsedJson["url"],
        created: parsedJson["created"],
      );
    } catch (e) {
      throw Exception("Json convert exception");
    }
  }

  CharacterDto(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.location,
      required this.episodes,
      required this.url,
      required this.created});
}
