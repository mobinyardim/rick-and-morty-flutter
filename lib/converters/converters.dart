

import 'package:rick_and_morty_flutter/converters/base_converter.dart';
import 'package:rick_and_morty_flutter/converters/character_converter.dart';
import 'package:rick_and_morty_flutter/converters/location_converter.dart';
import 'package:rick_and_morty_flutter/converters/response_converter.dart';

const BaseConverter locationConverter = LocationConverter();
const BaseConverter characterConverter = CharacterConverter();
const BaseConverter charactersResponseConverter = ResponseConverter(dataConverter: characterConverter);