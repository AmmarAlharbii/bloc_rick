import 'package:bloc_rick/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_rick/constant/color.dart';
import 'package:bloc_rick/data/models/character_model.dart';
import 'package:bloc_rick/presentation/widget/character_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.yellow,
        title: const Text('Characters'),
      ),
      body: BlocBuilder(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = (state).characters;
            return CharacterList(charactersList: allCharacters);
          } else {
            return const CircularProgressIndicator(
              color: AppColor.yellow,
            );
          }
        },
      ),
    );
  }
}
