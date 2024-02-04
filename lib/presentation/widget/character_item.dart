import 'package:bloc_rick/data/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(character.image),
        ),
      ),
    );
  }
}
