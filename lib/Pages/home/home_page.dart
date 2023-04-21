import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter/components/character_item.dart';

import '../../utils/character_faker.dart';
import '../../utils/window_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double itemWidth = isDesktop(context) ? 400 : 200;
    double ratio = isDesktop(context) ? 2.3 : 0.56;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: itemWidth, childAspectRatio: ratio),
              itemBuilder: (item, index) => (Align(
                  child:
                      CharacterItem(character: fakeNullCharacterList[index]))),
              itemCount: fakeNullCharacterList.length,
            ));
  }
}
