import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter/blocs/home/home_event.dart';
import 'package:rick_and_morty_flutter/blocs/home/home_state.dart';
import 'package:rick_and_morty_flutter/repositories/character/character_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CharacterRepository characterRepository;

  HomeBloc({required this.characterRepository}) : super(HomeInitial()) {
    on<HomeFetchFirstPage>((event, emit) async {
      emit(HomeLoadPage(characters: state.characters));
      try {
        var results = await characterRepository.getAllCharacters(1);
        emit(HomeIdle(
            characters: [...state.characters, ...results.results],
            lastPageInfo: results.info));
      } catch (e) {
        emit(HomeLoadPageError(
            characters: [...state.characters],
            lastPageInfo: state.lastPageInfo,
            error: e as Error));
      }
    });
  }
}
