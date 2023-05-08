import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/character/character_repository.dart';

class RepositoryProviders extends StatelessWidget {
  final Widget child;

  const RepositoryProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider<CharacterRepository>(
          create: (context) => (CharacterRepository.create()))
    ], child: child);
  }
}
