import 'package:bloc_rick/constant/color.dart';
import 'package:bloc_rick/data/models/character_model.dart';
import 'package:bloc_rick/presentation/widget/character_item.dart';
import 'package:flutter/material.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key, required this.charactersList});

  final List<Character> charactersList;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColor.grey,
        child: Column(
          children: [
            GridView.builder(
              itemCount: charactersList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return CharacterItem(
                  character: charactersList[index],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
