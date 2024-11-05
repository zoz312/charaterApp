import 'package:braekingbad/core/approuter/appRouter.dart';
import 'package:braekingbad/featrues/home/controller/characters_cubit/characters_cubit.dart';
import 'package:braekingbad/featrues/home/model/repo/characterepo.dart';
import 'package:braekingbad/featrues/home/model/webservice/charactersWebService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BearkingBadApp());
}

class BearkingBadApp extends StatelessWidget {
  const BearkingBadApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersCubit(Charactersrepo(characterswebservice: Characterswebservice()))..getAllCharacters(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
