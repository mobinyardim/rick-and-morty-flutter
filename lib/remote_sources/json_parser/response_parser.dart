import 'package:rick_and_morty_flutter/remote_sources/dto/paged_data_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/json_parser/base_json_parser.dart';
import '../../utils/logger.dart';
import 'json_convert_exception.dart';

class ResponseParser<T> extends BaseJsonParser<PagedDataDto> {
  final BaseJsonParser<T> resultParser;

  const ResponseParser({required this.resultParser});

  @override
  PagedDataDto<T> fromJson(Map<String, dynamic> json) {
    try {
      var results = (json["results"] as List<dynamic>);
      return PagedDataDto(
          info: InfoDto(
              count: json["info"]["count"],
              pages: json["info"]["pages"],
              next: json["info"]["next"],
              prev: json["info"]["prev"]),
          results: results.map((e) => resultParser.fromJson(e)).toList());
    } catch (e, stackTrace) {
      logger.e(e);
      logger.d(stackTrace);
      throw JsonConvertExceptions(
          "Json convert exception in response parser,$e");
    }
  }

  @override
  String toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
