import 'package:http/http.dart' show Client;
import 'package:rick_and_morty_flutter/remote_sources/character/character_remote_source.dart';
import 'package:rick_and_morty_flutter/remote_sources/character/character_remote_source_impl.dart';

const baseUrl= "https://rickandmortyapi.com/api/";

Client client = Client();

CharacterRemoteSource characterRemoteSource = CharacterRemoteSourceImpl();