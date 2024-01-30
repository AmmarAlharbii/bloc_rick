import 'package:bloc_rick/data/models/character_model.dart';
import 'package:bloc_rick/data/webServices/character_web_services.dart';

class CharactersReopsitory {
  final CharacterWebServices webServices;

  CharactersReopsitory(this.webServices);
  Future<List<Characters>> getAllCharacters() async {
    final characters = await webServices.getAllCharacters();
    return characters
        .map(
          (character) => Characters.fromJson(
              character), //to store every character into model and insert it into list
        )
        .toList();
  }
}
