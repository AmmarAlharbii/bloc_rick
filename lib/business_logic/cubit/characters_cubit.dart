import 'package:bloc/bloc.dart';
import 'package:bloc_rick/data/models/character_model.dart';
import 'package:bloc_rick/data/repository/character_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersReopsitory charactersReopsitory;
  List<Character> characters = [];
  CharactersCubit(this.charactersReopsitory) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersReopsitory.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters: characters)); //push the state
      this.characters = characters;
    });
    return characters;
  }
}
