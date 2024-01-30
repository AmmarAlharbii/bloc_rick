part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

// this class for states on loading characters
class CharactersLoaded extends CharactersState {
  final List<Characters> characters;
  CharactersLoaded({required this.characters});
}
