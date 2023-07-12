import 'package:bloc/bloc.dart';
import 'package:exam/models/levels.dart';
import 'package:exam/services/shared_preferences/cash_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'level_state.dart';

class LevelCubit extends Cubit<LevelState> {
  LevelCubit() : super(LevelInitial());
  static LevelCubit get(context) => BlocProvider.of(context);
  int score = 0;
  List<Level> levels = [
    Level(number: 1, unlocked: true),
    Level(number: 2),
    Level(number: 3),

  ];
  Future<void> loadProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < levels.length; i++) {
      levels[i].score = prefs.getInt('level_${levels[i].number}_score') ?? 0;
      levels[i].unlocked = prefs.getBool('level_${levels[i].number}_unlocked') ?? false;
    }
    emit(loadProgresssucssesful());
  }

  Future<void> saveProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < levels.length; i++) {
      prefs.setInt("level_${levels[i].number}_score", levels[i].score);
      prefs.setBool('level_${levels[i].number}_unlocked', levels[i].unlocked);
    }
    emit(saveProgresssucssesful());
  }

  void updateLevelScore(Level level, int score) {
    level.score = score;
    if (levels.indexOf(level) < levels.length - 1) {
      levels[levels.indexOf(level) + 1].unlocked = true;
    }
    emit(updateLevelScoresucssesful());
  }
}
