import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_flutter/Pages/navigation_items.dart';
import 'package:rick_and_morty_flutter/blocs/home/characters_bloc.dart';
import 'package:rick_and_morty_flutter/components/my_navigation_rail.dart';
import 'package:rick_and_morty_flutter/repositories/character/character_repository.dart';
import 'package:rick_and_morty_flutter/routes/routes.dart';

import '../components/drawer_item.dart';
import '../utils/window_utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedTabIndex = 0;

  void setSelectedTabIndex(int current) {
    setState(() {
      selectedTabIndex = current;
    });
  }

  var isNavigationRailExtended = false;

  void seNavigationRailExtended(bool extended) {
    setState(() {
      isNavigationRailExtended = extended;
    });
  }

  void _onItemTapped(int index, BuildContext context) {
    setSelectedTabIndex(index);
    switch (index) {
      case 0:
        const HomeRoute().push(context);
        break;
      case 1:
        const CharactersRoute().push(context);
        break;
      case 2:
        const EpisodesRoute().push(context);
        break;
      case 3:
        const LocationsRoute().push(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainPageNavigates(
        navigateToCharacters: () {
          _onItemTapped(1, context);
        },
        navigateToEpisodes: () {
          _onItemTapped(2, context);
        },
        navigateToHome: () {
          _onItemTapped(0, context);
        },
        navigateToLocations: () {
          _onItemTapped(3, context);
        },
        child: BlocProvider<CharactersBloc>(
            create: (BuildContext context) {
              return CharactersBloc(
                  characterRepository:
                      RepositoryProvider.of<CharacterRepository>(context));
            },
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  Scaffold(
                appBar: _createAppBar(context),
                body: _createBody(context),
                drawer: _createDrawer(context),
              ),
            )));
  }

  AppBar? _createAppBar(BuildContext context) {
    if (isDesktop(context)) {
      return null;
    } else {
      return AppBar(
        title: Text(widget.title),
      );
    }
  }

  Widget _createBody(BuildContext context) {
    if (isDesktop(context)) {
      return MyNavigationRail(
        extended: isNavigationRailExtended,
        onExtendedChange: (current) {
          seNavigationRailExtended(current);
        },
        leading: const SizedBox(
          height: 30,
        ),
        destinations: [
          ...navItems.map((item) => NavigationRailDestination(
              icon: Icon(item.icon), label: Text(item.label)))
        ],
        selectedIndex: selectedTabIndex,
        onDestinationSelected: (index) {
          _onItemTapped(index, context);
        },
        child: Padding(padding: const EdgeInsets.all(10), child: widget.child),
      );
    } else {
      return Container(child: widget.child);
    }
  }

  NavigationDrawer? _createDrawer(BuildContext context) {
    if (isDesktop(context)) {
      return null;
    } else {
      return NavigationDrawer(
        selectedIndex: selectedTabIndex,
        children: [
          ...navItems.mapIndexed((index, item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: DrawerItem(
                item: item,
                onTap: () {
                  _onItemTapped(index, context);
                  Navigator.pop(context);
                },
                key: Key(item.label),
                isSelected: selectedTabIndex == index,
              )))
        ],
      );
    }
  }
}

class MainPageNavigates extends InheritedWidget {
  final Function() navigateToHome;
  final Function() navigateToCharacters;
  final Function() navigateToLocations;
  final Function() navigateToEpisodes;

  const MainPageNavigates({
    Key? key,
    required this.navigateToHome,
    required this.navigateToCharacters,
    required this.navigateToLocations,
    required this.navigateToEpisodes,
    required Widget child,
  }) : super(key: key, child: child);

  static MainPageNavigates of(BuildContext context) {
    final MainPageNavigates? result =
        context.dependOnInheritedWidgetOfExactType<MainPageNavigates>();
    assert(result != null, 'No MainPageNavigates found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MainPageNavigates old) {
    return true;
  }
}
