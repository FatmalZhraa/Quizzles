import 'package:exam/bloc/level_cubit.dart';
import 'package:exam/views/ui_level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevelsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LevelCubit, LevelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = LevelCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text('Levels',style: TextStyle(color: Colors.cyanAccent)),
          ),
          body: Container(
            color: Colors.deepPurple.shade900,
            child: ListView.separated(
            itemCount: cubit.levels.length,
            separatorBuilder: (context, index) => SizedBox(
            height: 10,
            ),
            itemBuilder: (context, index) => GestureDetector(
            child: GestureDetector(
              onTap: () {
                if (cubit.levels[index].unlocked) {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LevelView(
                            level: cubit.levels[index],
                            onScoreChanged: (score) {
                              cubit.updateLevelScore(cubit.levels[index], score);
                              cubit.saveProgress();
                            },
                          ),
                    ),
                  );
                }
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Level ${cubit.levels[index].number}'),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (i) => Icon(
                              i < cubit.levels[index].score ~/ 3 ?
                              Icons.star : Icons.star_border,
                              size: 30,
                            ),
                      ),
                    ),
                  ],
                ),
                color: cubit.levels[index].unlocked ? Colors.white : Colors.grey[500],
              ),
            ),
            ),
        ),
          ),
        );
      },
    );
  }
}
