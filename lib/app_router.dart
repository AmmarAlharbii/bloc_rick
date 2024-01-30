import 'package:bloc_rick/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_rick/constant/strings.dart';
import 'package:bloc_rick/data/repository/character_repository.dart';
import 'package:bloc_rick/data/webServices/character_web_services.dart';
import 'package:bloc_rick/presentation/screen/characters_details_screen.dart';
import 'package:bloc_rick/presentation/screen/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersCubit charactersCubit;
  late CharactersReopsitory reopsitory;
  AppRouter() {
    reopsitory = CharactersReopsitory(CharacterWebServices());
    charactersCubit = CharactersCubit(reopsitory);
  }
  Route? generateRoute(RouteSettings settings) {
    // handle routes
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const CharactersDetailsScreen(),
        );
    }
    return null;
  }
}
