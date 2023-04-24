class ResponseDto<T> {
  final Info info;
  final List<T> results;

  const ResponseDto({required this.info, required this.results});
}

class Info {
  final int count;
  final int pages;
  final String next;
  final String prev;

  const Info(
      {required this.count,
      required this.pages,
      required this.next,
      required this.prev});
}
