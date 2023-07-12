import 'package:exam/bloc/level_cubit.dart';
import 'package:exam/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LevelCubit()),

      ],
      child: MaterialApp(
        home: HomeView(),),
    );
  }
}
