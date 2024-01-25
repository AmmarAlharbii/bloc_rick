import 'package:bloc_rick/constant/strings.dart';
import 'package:bloc_rick/presentation/screen/characters_details_screen.dart';
import 'package:bloc_rick/presentation/screen/characters_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // handle routes
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (context) => const CharactersScreen(),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const CharactersDetailsScreen(),
        );
    }
    return null;
  }
}
