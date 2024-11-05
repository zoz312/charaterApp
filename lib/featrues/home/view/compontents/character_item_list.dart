import 'package:braekingbad/constants.dart';
import 'package:braekingbad/featrues/home/controller/characters_cubit/characters_cubit.dart';
import 'package:braekingbad/featrues/home/model/charactersModel.dart';
import 'package:braekingbad/featrues/home/view/compontents/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterItemList extends StatelessWidget {
  const CharacterItemList({super.key, required this.state});
 final List<Charactersmodel> state;
  @override
  Widget build(BuildContext context) {
    return 
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.length,
            itemBuilder: (ctx, index) {
              return CharacterItem(
                character: state[index],
              );
            },
          );
       
  }
}
