import 'package:rick_and_morty_flutter/remote_sources/dto/location_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/json_parser/base_json_parser.dart';

class LocationParser extends BaseJsonParser<LocationDto> {
  const LocationParser() : super();

  @override
  LocationDto fromJson(Map<String, dynamic> json) {
    try{
      return LocationDto(url: json["url"], name: json["name"]);
    }catch(e){
      throw Exception("Json convert exception");
    }
  }

  @override
  String toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
