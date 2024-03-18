import 'package:bloc_rick/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_rick/constant/color.dart';
import 'package:bloc_rick/data/models/character_model.dart';
import 'package:bloc_rick/presentation/widget/character_item.dart';
import 'package:bloc_rick/presentation/widget/character_list.dart';
import 'package:bloc_rick/presentation/widget/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  late List<Character> filterdList;
  final textController = TextEditingController();
  var isSearching = false;

  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  void stopSearch() {
    setState(() {
      isSearching = false;
      textController.clear();
    });
  }

  void startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(
        onRemove: stopSearch,
      ),
    );
    setState(() {
      isSearching = true;
    });
  }

  void searchFilterd(String searchedCharacter) {
    setState(() {
      filterdList = allCharacters
          .where(
            (character) => character.name
                .trim()
                .toLowerCase()
                .startsWith(searchedCharacter),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: AppColor.yellow,
        title: !isSearching
            ? const Text(
                'Characters',
                style: TextStyle(
                  color: AppColor.white,
                  shadows: [
                    BoxShadow(blurRadius: 2),
                  ],
                ),
              )
            : SearchTextField(
                textController: textController,
                onChanged: (value) => searchFilterd(value),
              ),
        actions: [
          if (isSearching)
            IconButton(
              onPressed: () {
                textController.clear();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.clear,
                color: AppColor.grey,
              ),
            ),
          if (!isSearching)
            IconButton(
              onPressed: startSearch,
              icon: const Icon(
                Icons.search,
                color: AppColor.grey,
              ),
            )
        ],
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = (state).characters;
            return CharacterList(
              body: Column(
                children: [
                  if (allCharacters.isEmpty)
                    const Center(
                      child: Text(
                        "empty",
                        style: TextStyle(color: AppColor.white),
                      ),
                    ),
                  GridView.builder(
                    itemCount: textController.text.isEmpty
                        ? allCharacters.length
                        : filterdList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CharacterItem(
                        character: textController.text.isEmpty
                            ? allCharacters[index]
                            : filterdList[index],
                      );
                    },
                  )
                ],
              ),
            );
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
