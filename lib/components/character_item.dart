import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:rick_and_morty_flutter/components/shimmer.dart';
import 'package:uuid/uuid.dart';
import '../models/Character.dart';
import '../utils/window_utils.dart';

extension HeroTags on Character {
  String getImageHeroTag() {
    return "character_image_$id";
  }

  String getNameHeroTag() {
    return "character_name_$id";
  }
}

class CharacterItem extends StatelessWidget {
  final Character? character;
  final void Function()? onPressed;

  const CharacterItem({Key? key, this.character, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = isDesktop(context) ? 300 : 180;

    return Card(
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Material(
          child: InkWell(
              onTap: onPressed,
              child: SizedBox(
                width: cardWidth,
                child: Flex(
                  direction:
                      isDesktop(context) ? Axis.horizontal : Axis.vertical,
                  children: [
                    Hero(
                        tag: character?.getImageHeroTag() ??
                            const Uuid().v4(),
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: ShimmerOrChildWithData<Character>(
                                data: character,
                                width: const ShimmerWidth.fullWidth(),
                                height: const ShimmerHeight.fullHeight(),
                                getChild: (character) {
                                  return Image.network(
                                    character.image,
                                    width: isDesktop(context) ? 100 : cardWidth,
                                    height:
                                        isDesktop(context) ? 100 : cardWidth,
                                  );
                                }))),
                    _getItemContent(context)
                  ],
                ),
              ))),
    );
  }

  Widget _getItemContent(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShimmerOrChildWithData(
                    data: character,
                    width: const ShimmerWidth.fullWidth(),
                    getChild: (character) => (SizedBox(
                        height: 24,
                        child: Hero(
                            tag: character.getNameHeroTag(),
                            child: AutoSizeText(
                              character.name,
                              style: Theme.of(context).textTheme.titleLarge,
                              maxLines: 1,
                              overflowReplacement: Marquee(
                                blankSpace: 20,
                                pauseAfterRound:
                                    const Duration(milliseconds: 1000),
                                text: character.name,
                                style: Theme.of(context).textTheme.titleLarge,
                                scrollAxis: Axis.horizontal,
                              ),
                            ))))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 10,
                        height: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: _getStatusColor()),
                        )),
                    const SizedBox(
                      width: 4,
                      height: 4,
                    ),
                    Expanded(
                        child: ShimmerOrChild(
                            isLoading: character == null,
                            width: const ShimmerWidth.fullWidth(),
                            child: Text(_getStatus(),
                                style: Theme.of(context).textTheme.bodySmall))),
                    Text(" - ", style: Theme.of(context).textTheme.bodySmall),
                    Expanded(
                        child: ShimmerOrChildWithData(
                            data: character,
                            width: const ShimmerWidth.fullWidth(),
                            getChild: (character) => (Text(character.species,
                                style:
                                    Theme.of(context).textTheme.bodySmall)))),
                  ],
                ),
                Text(
                  "Last Location:",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                ShimmerOrChildWithData(
                    data: character,
                    width: const ShimmerWidth.fullWidth(),
                    height: const ShimmerHeight.small(),
                    getChild: (character) => (SizedBox(
                        height: 20,
                        child: AutoSizeText(
                          character.location.name,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflowReplacement: Marquee(
                            text: character.location.name,
                            style: Theme.of(context).textTheme.bodySmall,
                            pauseAfterRound: const Duration(milliseconds: 1000),
                            blankSpace: 20,
                            scrollAxis: Axis.horizontal,
                          ),
                        ))))
              ],
            )));
  }

  Color _getStatusColor() {
    Color statusColor = Colors.red;
    switch (character?.status ?? CharacterStatus.unknown) {
      case CharacterStatus.alive:
        {
          statusColor = Colors.green;
          break;
        }
      case CharacterStatus.dead:
        statusColor = Colors.red;
        break;
      case CharacterStatus.unknown:
        statusColor = Colors.grey;
        break;
    }
    return statusColor;
  }

  String _getStatus() {
    String statusText = "";
    switch (character?.status ?? CharacterStatus.unknown) {
      case CharacterStatus.alive:
        statusText = "Alive";
        break;
      case CharacterStatus.dead:
        statusText = "Dead";
        break;
      case CharacterStatus.unknown:
        statusText = "Unknown";
        break;
    }
    return statusText;
  }
}
