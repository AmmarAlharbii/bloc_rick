import 'package:bloc_rick/constant/color.dart';
import 'package:bloc_rick/data/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.white,
      ),
      child: GridTile(
        footer: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          width: double.infinity,
          color: Colors.black54,
          alignment: Alignment.center,
          child: Text(
            character.name,
            maxLines: 2,
            style: const TextStyle(
                color: AppColor.white,
                fontSize: 16,
                height: 1.5,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
        child: Container(
          color: AppColor.grey,
          child: FadeInImage.assetNetwork(
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: "assets/images/Loading.gif",
              image: character.image),
        ),
      ),
    );
  }
}
