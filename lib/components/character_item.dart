import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import '../models/Character.dart';
import '../utils/window_utils.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

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
            Image.network(
              character.image,
              width: isDesktop(context) ? 100 : cardWidth,
              height: isDesktop(context) ? 100 : cardWidth,
            ),
            isDesktop(context)
                ? Expanded(child: _getItemContent(context))
                :  _getItemContent(context)
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
            SizedBox(
                height: 24,
                child: Marquee(
                  text: character.name,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                  scrollAxis: Axis.horizontal,
                )),
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
                          shape: BoxShape.circle,
                          color: _getStatusColor()),
                    )),
                const SizedBox(
                  width: 4,
                  height: 4,
                ),
                Text(_getStatus(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge),
                Text(" - ",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge),
                Text(character.species,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge)
              ],
            ),
            const SizedBox(height: 6),
            Text(
              "Last Location:",
              style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall,
            ),
            const SizedBox(height: 4),
            Text(
              character.location.name,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
            )
          ],
        ));
  }

  Color _getStatusColor() {
    Color statusColor = Colors.red;
    switch (character.status) {
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
    switch (character.status) {
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
