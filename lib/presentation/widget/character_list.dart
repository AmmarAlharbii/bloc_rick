import 'package:bloc_rick/constant/color.dart';
import 'package:bloc_rick/data/models/character_model.dart';
import 'package:bloc_rick/presentation/widget/character_item.dart';
import 'package:flutter/material.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key, required this.body});

  final Widget body;
  @override
  Widget build(BuildContext context) {
    // print(charactersList.length);
    return SingleChildScrollView(
      child: Container(
        color: AppColor.grey,
        child:body
      ),
    );
  }
}
