import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter/blocs/characters/characters_event.dart';
import 'package:rick_and_morty_flutter/blocs/characters/characters_state.dart';
import 'package:rick_and_morty_flutter/repositories/character/character_repository.dart';
import 'package:rick_and_morty_flutter/utils/logger.dart';

import '../../utils/character_faker.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository characterRepository;

  CharactersBloc({required this.characterRepository})
      : super(CharactersInitial()) {
    on<CharactersFetchFirstPage>((event, emit) async {
      if (state is! CharactersLoadPage) {
        await _fetchFirstPage(emit);
      }
    });
    on<CharactersFetchNextPage>((event, emit) async {
      await _fetchNextPage(emit);
    });
  }

  _fetchFirstPage(Emitter<CharactersState> emit) async {
    emit(CharactersLoadPage(characters: state.characters, lastPageIndex: 0));
    try {
      var results = await characterRepository.getAllCharacters(1);
      emit(CharactersIdle(
          characters: [...results.results],
          lastPageInfo: results.info,
          lastPageIndex: 1));
    } catch (e) {
      logger.d(e.toString());
      emit(CharactersLoadPageError(
          characters: [],
          lastPageInfo: state.lastPageInfo,
          lastPageIndex: 0,
          error: e as Exception));
    }
  }

  _fetchNextPage(Emitter<CharactersState> emit) async {
    if (state.lastPageInfo?.next != null) {
      final beforeFakeData = state.characters;
      emit(CharactersLoadPage(
          characters: [...state.characters, ...fakeNullCharacterList],
          lastPageIndex: state.lastPageIndex));
      try {
        var results =
            await characterRepository.getAllCharacters(state.lastPageIndex + 1);
        emit(CharactersIdle(
            characters: [...beforeFakeData, ...results.results],
            lastPageInfo: results.info,
            lastPageIndex: state.lastPageIndex + 1));
      } catch (e) {
        logger.d(e.toString());
        emit(CharactersLoadPageError(
            characters: [],
            lastPageInfo: state.lastPageInfo,
            lastPageIndex: state.lastPageIndex,
            error: e as Exception));
      }
    }
  }
}
