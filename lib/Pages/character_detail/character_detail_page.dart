import 'package:flutter/material.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({Key? key}) : super(key: key);

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [Text("character detail page!")],
    );
  }
}
