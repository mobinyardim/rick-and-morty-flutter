import 'dart:convert';

import 'package:rick_and_morty_flutter/remote_sources/character/character_remote_source.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/character_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/paged_data_dto.dart';
import 'package:rick_and_morty_flutter/remote_sources/json_parser/Parsers.dart';
import 'package:rick_and_morty_flutter/remote_sources/network.dart';

class CharacterRemoteSourceImpl extends CharacterRemoteSource {
  CharacterRemoteSourceImpl._internal();

  static final _instance = CharacterRemoteSourceImpl._internal();

  factory CharacterRemoteSourceImpl.create() {
    return _instance;
  }

  @override
  Future<PagedDataDto<CharacterDto>> getAll(int page) async{
    final uri = Uri.https(baseUrl, "/api/character/" , {"page": page.toString()});

    final response = await client.get(uri);
    if (response.statusCode == 200) {
      return characterResponseParser.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          "network fail with ${response.statusCode} status code ${response.body}");
    }
  }
}
