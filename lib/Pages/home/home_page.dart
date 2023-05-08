import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter/blocs/home/characters_bloc.dart';
import 'package:rick_and_morty_flutter/blocs/home/characters_event.dart';
import 'package:rick_and_morty_flutter/blocs/home/characters_state.dart';
import 'package:rick_and_morty_flutter/components/character_item.dart';
import 'package:rick_and_morty_flutter/routes/routes.dart';
import '../../utils/window_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersBloc>(context).add(CharactersFetchFirstPage());
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = isDesktop(context) ? 400 : 200;
    double ratio = isDesktop(context) ? 2.3 : 0.56;

    return Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: itemWidth, childAspectRatio: ratio),
                itemBuilder: (item, index) => (Align(
                        child: CharacterItem(
                      character: state.characters[index],
                      onPressed: () => {
                        CharacterDetailRoute(
                                characterId: state.characters[index]?.id ?? "0")
                            .push(context)
                      },
                    ))),
                itemCount: state.characters.length);
          },
        ));
  }
}
