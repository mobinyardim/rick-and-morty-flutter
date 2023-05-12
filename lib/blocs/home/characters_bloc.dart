import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter/blocs/home/characters_event.dart';
import 'package:rick_and_morty_flutter/blocs/home/characters_state.dart';
import 'package:rick_and_morty_flutter/repositories/character/character_repository.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository characterRepository;

  CharactersBloc({required this.characterRepository})
      : super(CharactersInitial()) {
    on<CharactersFetchFirstPage>((event, emit) async {
      await _fetchFirstPage(emit);
    });
  }

  _fetchFirstPage(Emitter<CharactersState> emit) async {
    emit(CharactersLoadPage(characters: state.characters));
    try {
      var results = await characterRepository.getAllCharacters(1);
      emit(CharactersIdle(
          characters: [...results.results], lastPageInfo: results.info));
    } catch (e) {
      emit(CharactersLoadPageError(
          characters: [],
          lastPageInfo: state.lastPageInfo,
          error: e as Error));
    }
  }
}
