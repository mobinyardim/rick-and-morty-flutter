class Character {
  final String id;
  final String name;
  final CharacterStatus status;
  final String species;
  final String? type;
  final Gender gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;

  const Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url});
}

class Origin {
  String name;
  String? url;

  Origin({required this.name, this.url});
}

class Location {
  String name;
  String? url;

  Location({required this.name, this.url});
}

enum CharacterStatus {
  alive,
  dead,
  unknown;
}

enum Gender { female, male, genderless, unknown }
