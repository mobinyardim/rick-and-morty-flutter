import 'package:go_router/go_router.dart';

import '../Pages/characters/characters_page.dart';
import '../Pages/episodes/episodes_page.dart';
import '../Pages/home/home_page.dart';
import '../Pages/locations/locations_page.dart';
import '../Pages/main_page.dart';

enum Routes {
  home(path: "/"),
  characters(path: "/characters"),
  episodes(path: "/episodes"),
  locations(path: "/locations");

  const Routes({required this.path});

  final String path;
}

final routerConfig = GoRouter(routes: [
  ShellRoute(
      builder: (context, state, child) {
        return MainPage(title: "Rick And Morty", child: child);
      },
      routes: [
        GoRoute(
            path: Routes.home.path,
            builder: (context, state) {
              return const HomePage();
            }),
        GoRoute(
            path: Routes.characters.path,
            builder: (context, state) {
              return const CharactersPage();
            }),
        GoRoute(
            path: Routes.episodes.path,
            builder: (context, state) {
              return const EpisodesPage();
            }),
        GoRoute(
            path: Routes.locations.path,
            builder: (context, state) {
              return const LocationsPage();
            })
      ])
]);