import 'package:rick_and_morty_flutter/converters/base_converter.dart';
import 'package:rick_and_morty_flutter/converters/character_converter.dart';
import 'package:rick_and_morty_flutter/converters/location_converter.dart';
import 'package:rick_and_morty_flutter/converters/response_converter.dart';
import 'package:rick_and_morty_flutter/models/PagedData.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/character_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/location_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/paged_data_dto.dart';

import '../models/Character.dart';

const BaseConverter<Location, LocationDto> locationConverter =
    LocationConverter();

const BaseConverter<Character, CharacterDto> characterConverter =
    CharacterConverter();

const BaseConverter<PagedData<Character>, PagedDataDto<CharacterDto>>
    charactersResponseConverter = ResponseConverter<Character, CharacterDto>(
        dataConverter: characterConverter);
