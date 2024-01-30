import 'package:bloc_rick/data/webServices/character_web_services.dart';
import 'package:flutter/material.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed:()   {
            CharacterWebServices().getAllCharacters();
          },
          child: const Text('print data'),
        ),
      ),
    );
  }
}
