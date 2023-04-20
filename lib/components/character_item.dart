import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:rick_and_morty_flutter/components/shimmer.dart';
import '../models/Character.dart';
import '../utils/window_utils.dart';

class CharacterItem extends StatelessWidget {
  final Character? character;

  const CharacterItem({Key? key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = isDesktop(context) ? 300 : 180;

    return Card(
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: SizedBox(
        width: cardWidth,
        child: Flex(
          direction: isDesktop(context) ? Axis.horizontal : Axis.vertical,
          children: [
            ShimmerOrChildWithData<Character>(
                data: character,
                width: ShimmerWidth.custom(
                    size: isDesktop(context) ? 100 : cardWidth),
                height: ShimmerHeight.custom(
                    size: isDesktop(context) ? 110 : cardWidth),
                getChild: (character) => (Image.network(
                      character.image,
                      width: isDesktop(context) ? 100 : cardWidth,
                      height: isDesktop(context) ? 100 : cardWidth,
                    ))),
            isDesktop(context)
                ? Expanded(child: _getItemContent(context))
                : _getItemContent(context)
          ],
        ),
      ),
    );
  }

  Widget _getItemContent(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ShimmerOrChildWithData(
                data: character,
                width: const ShimmerWidth.fullWidth(),
                getChild: (character) => (SizedBox(
                    height: 24,
                    child: Marquee(
                      text: character.name,
                      style: Theme.of(context).textTheme.titleLarge,
                      scrollAxis: Axis.horizontal,
                    )))),
            const SizedBox(height: 4),
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
                ShimmerOrChild(
                    isLoading: character == null,
                    width: const ShimmerWidth.medium(),
                    child: Text(_getStatus(),
                        style: Theme.of(context).textTheme.bodyLarge)),
                Text(" - ", style: Theme.of(context).textTheme.bodyLarge),
                ShimmerOrChildWithData(
                    data: character,
                    width: const ShimmerWidth.medium(),
                    getChild: (character) => (Text(character.species,
                        style: Theme.of(context).textTheme.bodyLarge))),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              "Last Location:",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 4),
            ShimmerOrChildWithData(
                data: character,
                width: const ShimmerWidth.fullWidth(),
                height: const ShimmerHeight.small(),
                getChild: (character) => (Text(
                      character.location.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )))
          ],
        ));
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
