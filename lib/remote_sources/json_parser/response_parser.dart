import 'package:rick_and_morty_flutter/remote_sources/dto/response_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/json_parser/base_json_parser.dart';

class ResponseParser<T> extends BaseJsonParser<ResponseDto> {
  final BaseJsonParser<T> resultParser;

  const ResponseParser({required this.resultParser});

  @override
  ResponseDto fromJson(Map<String, dynamic> json) {
    try {
      var results = (json["results"] as List<Map<String, dynamic>>);
      return ResponseDto(
          info: Info(
              count: json["info"]["count"],
              pages: json["info"]["pages"],
              next: json["info"]["next"],
              prev: json["info"]["prev"]),
          results: results.map((e) => resultParser.fromJson(e)).toList());
    } catch (e) {
      throw Exception("Json convert exception");
    }
  }

  @override
  String toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
