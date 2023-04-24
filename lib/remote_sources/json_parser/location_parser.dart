import 'package:rick_and_morty_flutter/remote_sources/dto/location_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/json_parser/base_json_parser.dart';
import '../../utils/logger.dart';

class LocationParser extends BaseJsonParser<LocationDto> {
  const LocationParser() : super();

  @override
  LocationDto fromJson(Map<String, dynamic> json) {
    try {
      return LocationDto(url: json["url"], name: json["name"]);
    } catch (e, stackTrace) {
      logger.e(e);
      logger.d(stackTrace);
      throw Exception("Json convert exception in location parser,$e");
    }
  }

  @override
  String toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
