import 'dart:convert';

import 'package:rick_and_morty_flutter/remote_sources/character/character_remote_source.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/character_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/response_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/json_parser/Parsers.dart';
import 'package:rick_and_morty_flutter/remote_sources/network.dart';

class CharacterRemoteSourceImpl extends CharacterRemoteSource {
  @override
  Future<ResponseDto<CharacterDto>> getAll() async {
    var response = await client.get(Uri.parse("$baseUrl/character/"));
    if (response.statusCode == 200) {
      return characterResponseParser.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          "network fail with ${response.statusCode} status code ${response.body}");
    }
  }
}
