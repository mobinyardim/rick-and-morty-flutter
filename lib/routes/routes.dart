import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_flutter/Pages/character_detail/character_detail_page.dart';
import 'package:rick_and_morty_flutter/Pages/characters/characters_page.dart';
import 'package:rick_and_morty_flutter/Pages/episodes/episodes_page.dart';
import 'package:rick_and_morty_flutter/Pages/home/home_page.dart';
import 'package:rick_and_morty_flutter/Pages/locations/locations_page.dart';
import 'package:rick_and_morty_flutter/Pages/main_page.dart';

part 'routes.g.dart';

@TypedShellRoute<HomeContainerRoute>(routes: [
  TypedGoRoute<HomeRoute>(path: "/"),
  TypedGoRoute<CharactersRoute>(path: "/characters"),
  TypedGoRoute<EpisodesRoute>(path: "/episodes"),
  TypedGoRoute<LocationsRoute>(path: "/locations"),
  TypedGoRoute<CharacterDetailRoute>(path: "/character-detail/:characterId"),
])
@immutable
class HomeContainerRoute extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MainPage(title: "Rick And Morty", child: navigator);
  }
}

@immutable
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<Function>(
      key: state.pageKey,
      child: const HomePage(),
      transitionDuration: const Duration(milliseconds: 150),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) {
        // Change the opacity of the screen using a Curve based on the the animation's
        // value
        return FadeTransition(
          opacity:
          CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        );
      },
    );
  }
}

@immutable
class CharactersRoute extends GoRouteData {
  const CharactersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CharactersPage();
  }

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<Function>(
      key: state.pageKey,
      child: const CharactersPage(),
      transitionDuration: const Duration(milliseconds: 150),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) {
        // Change the opacity of the screen using a Curve based on the the animation's
        // value
        return FadeTransition(
          opacity:
          CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        );
      },
    );
  }
}

@immutable
class EpisodesRoute extends GoRouteData {
  const EpisodesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EpisodesPage();
  }
}

@immutable
class LocationsRoute extends GoRouteData {
  const LocationsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LocationsPage();
  }
}

@immutable
class CharacterDetailRoute extends GoRouteData {
  final String characterId;

  const CharacterDetailRoute({required this.characterId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CharacterDetailPage(characterId: characterId);
  }
}
