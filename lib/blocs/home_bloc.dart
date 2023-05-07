import 'package:rick_and_morty_flutter/models/Character.dart';
import 'package:rick_and_morty_flutter/repositories/character/character_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBlock {
  final _characterRepository = CharacterRepository.create();

  final _characterFetcher = PublishSubject<List<Character>>();

  Stream<List<Character>> get allCharacters => _characterFetcher.stream;

  fetchAllMovies() async {
    var result = await _characterRepository.getAllCharacters(0);
    _characterFetcher.sink.add(result.results);
  }

  dispose() {
    _characterFetcher.close();
  }
}

final homeBloc = HomeBlock();
