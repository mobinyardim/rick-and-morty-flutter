import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter/blocs/home/characters_bloc.dart';
import 'package:rick_and_morty_flutter/blocs/home/characters_state.dart';
import 'package:rick_and_morty_flutter/components/character_item.dart';
import 'package:rick_and_morty_flutter/components/grid_with_title.dart';
import 'package:rick_and_morty_flutter/routes/routes.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _HomePageState();
}

class _HomePageState extends State<CharactersPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) => (GridWithTitle(
            itemsBuilder: (item, index) => (Align(
                child: CharacterItem(
              character: state.characters[index],
              onPressed: () => {
                CharacterDetailRoute(
                        characterId: state.characters[index]?.id ?? "0")
                    .push(context)
              },
            ))),
            itemCount: state.characters.length,
            animateHeader: true,
            title: "Characters",
            showSeeMoreButton: false,
          )),
        ));
    ;
  }
}
