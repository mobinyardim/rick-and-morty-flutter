class ResponseDto<T> {
  final InfoDto info;
  final List<T> results;

  const ResponseDto({required this.info, required this.results});
}

class InfoDto {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  const InfoDto({required this.count, required this.pages, this.next, this.prev});
}
