class Result<T> {
  Info info;
  List<T> results;

  Result({required this.info, required this.results});
}

class Info {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  const Info({required this.count, required this.pages, this.next, this.prev});
}
