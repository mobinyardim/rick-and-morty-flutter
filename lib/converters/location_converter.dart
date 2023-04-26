import 'package:rick_and_morty_flutter/converters/base_converter.dart';
import 'package:rick_and_morty_flutter/models/Character.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/location_dto.dart';

class LocationConverter extends BaseConverter<Location, LocationDto> {
  const LocationConverter() : super();

  @override
  Location toDomain(LocationDto dto) {
    return Location(name: dto.name, url: dto.url);
  }

  @override
  LocationDto toDto(Location domain) {
    // TODO: implement toDto
    throw UnimplementedError();
  }
}
