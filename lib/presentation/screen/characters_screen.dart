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
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        backgroundColor: AppColor.yellow,
        title: const Text(
          'Characters',
          style: TextStyle(
            color: AppColor.white,
            fontWeight: FontWeight.w800,
            shadows: [
              BoxShadow(blurRadius: 5),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = (state).characters;
            return CharacterList(charactersList: allCharacters);
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.yellow,
              ),
            );
          }
        },
      ),
    );
  }
}
