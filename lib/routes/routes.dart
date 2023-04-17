enum Routes {
  home(path: "/"),
  characters(path: "/characters"),
  episodes(path: "/episodes"),
  locations(path: "/locations");

  const Routes({required this.path});

  final String path;
}
