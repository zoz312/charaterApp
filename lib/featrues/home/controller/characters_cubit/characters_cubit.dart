import 'package:bloc/bloc.dart';
import 'package:braekingbad/featrues/home/model/charactersModel.dart';
import 'package:braekingbad/featrues/home/model/repo/characterepo.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final Charactersrepo charactersrepo;
  CharactersCubit(this.charactersrepo) : super(CharactersInitial());
   List<Charactersmodel> characters =[];
  Future<List<Charactersmodel>> getAllCharacters() async {
    charactersrepo.getAllCharacters().then(
      (characters) {
        emit(Charactersloaded(character: characters));
        this.characters = characters;
      },
    );
    return characters;
  }
}
