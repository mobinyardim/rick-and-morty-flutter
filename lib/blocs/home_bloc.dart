import 'package:rick_and_morty_flutter/models/Character.dart';
import 'package:rick_and_morty_flutter/repositories/character/character_repository.dart';
import 'package:rick_and_morty_flutter/utils/character_faker.dart';
import 'package:rxdart/rxdart.dart';

class HomeBlock {
  final _characterRepository = CharacterRepository.create();

  final _characterFetcher = BehaviorSubject<List<Character?>>();

  Stream<List<Character?>> get allCharacters => _characterFetcher.stream;

  fetchAllMovies() async {
    _characterFetcher.sink.add(fakeNullCharacterList);
    await Future.delayed(const Duration(seconds: 3));
    var result = await _characterRepository.getAllCharacters(0);
    _characterFetcher.sink.add(result.results);
  }

  dispose() {
    _characterFetcher.close();
  }
}

final homeBloc = HomeBlock();
