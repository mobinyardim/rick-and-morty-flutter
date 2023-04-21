import 'package:rick_and_morty_flutter/models/Character.dart';

Character fakeCharacter = Character(
    id: "1",
    name: "Abadango Cluster Princess",
    status: CharacterStatus.alive,
    species: "Human",
    gender: Gender.male,
    origin: Origin(name: "Earth", url: ""),
    location: Location(name: "Earth", url: ""),
    image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg",
    episode: ["episode 1", "episode 2"],
    url: "url");

List<Character> fakeCharacterList = [
  for (var i = 1; i <= 10; i++) fakeCharacter
];
List<Character?> fakeNullCharacterList = [for (var i = 1; i <= 10; i++) null];
