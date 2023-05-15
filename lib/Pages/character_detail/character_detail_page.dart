import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_flutter/blocs/characters/characters_bloc.dart';
import 'package:rick_and_morty_flutter/blocs/characters/characters_state.dart';
import 'package:rick_and_morty_flutter/components/character_item.dart';

import '../../components/shimmer.dart';
import '../../models/Character.dart';
import '../../utils/window_utils.dart';

class CharacterDetailPage extends StatefulWidget {
  final String characterId;

  const CharacterDetailPage({Key? key, required this.characterId})
      : super(key: key);

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
      Character? character = state.characters
          .firstWhere((element) => element?.id == widget.characterId);
      return character != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_characterDetail(character)])
          : const Text("Error!");
    });
  }

  Widget _characterDetail(Character character) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            isDesktop(context)
                ? SizedBox(
                    height: 20,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          child: const Icon(Icons.close)),
                    ),
                  )
                : Container(),
            Flex(
                direction: isDesktop(context) ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      _getImage(character),
                      isDesktop(context)
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.all(5),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                      onTap: () {
                                        GoRouter.of(context).pop();
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        size: 32,
                                      ))),
                            )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                    height: 20,
                  ),
                  Column(children: [
                    Hero(tag: character.getNameHeroTag() , child:Text(
                      character.name,
                      style: Theme.of(context).textTheme.displaySmall,
                    ))
                  ])
                ])
          ],
        ));
  }

  Widget _getImage(
    Character character,
  ) {
    double imageSize = isDesktop(context) ? 300 : double.infinity;

    return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
            tag: character.getImageHeroTag(),
            child: SizedBox(
                width: imageSize,
                child: AspectRatio(
                    aspectRatio: 1,
                    child: ShimmerOrChildWithData<Character>(
                        data: character,
                        width: const ShimmerWidth.fullWidth(),
                        height: const ShimmerHeight.fullHeight(),
                        getChild: (character) {
                          return (Image.network(
                            character.image,
                            width: imageSize,
                            fit: BoxFit.fill,
                          ));
                        })))));
  }
}
