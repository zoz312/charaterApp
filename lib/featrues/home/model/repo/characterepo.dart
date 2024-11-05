import 'package:braekingbad/featrues/home/model/charactersModel.dart';
import 'package:braekingbad/featrues/home/model/webservice/charactersWebService.dart';

class Charactersrepo {
  final Characterswebservice characterswebservice;

  Charactersrepo({required this.characterswebservice});

  Future<List<Charactersmodel>> getAllCharacters() async {
    final characters = await characterswebservice.getAllCharacters();
    List<Charactersmodel> data = [];
    for (var character in characters) {
      data.add(Charactersmodel.fromJson(character));
    }
    return data;
  }
}
