import 'package:rick_and_morty_flutter/remote_sources/dto/character_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/json_parser/character_parser.dart';
import 'package:rick_and_morty_flutter/remote_sources/json_parser/location_parser.dart';
import 'package:rick_and_morty_flutter/remote_sources/json_parser/response_parser.dart';

const locationParser = LocationParser();
const characterParser = CharacterParser();
const characterResponseParser =
    ResponseParser<CharacterDto>(resultParser: characterParser);
