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
