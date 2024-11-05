import 'package:braekingbad/constants.dart';
import 'package:braekingbad/featrues/home/controller/characters_cubit/characters_cubit.dart';
import 'package:braekingbad/featrues/home/model/charactersModel.dart';
import 'package:braekingbad/featrues/home/view/compontents/character_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  late List<Charactersmodel> allCharacters;
  List<Charactersmodel> Searchcharacter = [];
  String onesearch = '';
  bool isseaerch = false;
  TextEditingController _searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: isseaerch
              ? TextField(
                  controller: _searchTextController,
                  cursorColor: myGrey,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _searchTextController.clear();
                          });
                          setState(() {
                            isseaerch = false;
                          });

                          setState(() {
                            onesearch = '';
                          });
                          //  GoRouter.of(context).pop(context);
                        },
                        icon: Icon(Icons.clear)),
                    hintText: 'Find a character...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: myGrey, fontSize: 18),
                  ),
                  style: TextStyle(color: myGrey, fontSize: 18),
                  onChanged: (searchedCharacter) {
                    onesearch = searchedCharacter;
                    Searchcharacter = allCharacters
                        .where((character) => character.name
                            .toString()
                            .toLowerCase()
                            .startsWith(onesearch))
                        .toList();
                    setState(() {});
                  },
                )
              : Text(
                  'Characters',
                  style: TextStyle(color: myGrey),
                ),
          backgroundColor: myYellow,
          actions: [
            isseaerch
                ? Container()
                : IconButton(
                    onPressed: () {
                      isseaerch = true;
                      setState(() {});
                    },
                    icon: Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            if (state is Charactersloaded) {
              allCharacters = state.character;
              return onesearch.isEmpty
                  ? CharacterItemList(
                    state: allCharacters,
                  )
                  : Searchcharacter.isEmpty
                      ? Center(
                          child: Text(
                            ' There is no person with this name',
                            style: TextStyle(fontSize: 25, color: myGrey),
                          ),
                        )
                      : CharacterItemList(
                          state: Searchcharacter,
                        );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: myYellow,
                ),
              );
            }
          },
        ));
  }
}
