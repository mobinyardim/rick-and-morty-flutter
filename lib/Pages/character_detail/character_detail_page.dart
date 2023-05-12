import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              print("back button pressed");
              context.pop();
            },
            child: const Icon(Icons.arrow_back_ios)),
        Text("the character id is: ${widget.characterId}")
      ],
    );
  }
}
