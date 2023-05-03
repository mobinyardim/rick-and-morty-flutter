import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter/blocs/home_bloc.dart';
import 'package:rick_and_morty_flutter/components/character_item.dart';
import 'package:rick_and_morty_flutter/models/Character.dart';
import 'package:rick_and_morty_flutter/routes/routes.dart';
import '../../utils/window_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double itemWidth = isDesktop(context) ? 400 : 200;
    double ratio = isDesktop(context) ? 2.3 : 0.56;
    homeBloc.fetchAllMovies();
    return Padding(
        padding: const EdgeInsets.all(20),
        child: StreamBuilder<List<Character>>(
          stream: homeBloc.allCharacters,
          builder: (context, AsyncSnapshot<List<Character>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: itemWidth, childAspectRatio: ratio),
                  itemBuilder: (item, index) => (Align(
                      child: CharacterItem(character: snapshot.data![index],onPressed: ()=>{
                        CharacterDetailRoute(characterId:snapshot.data![index].id).push(context)
                      },))),
                  itemCount: snapshot.data!.length);
            } else if (snapshot.hasError) {
              return Text(snapshot.error?.toString() ?? "unknown");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
