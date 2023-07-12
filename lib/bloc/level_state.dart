part of 'level_cubit.dart';

@immutable
abstract class LevelState {}

class LevelInitial extends LevelState {}
class loadProgresssucssesful extends LevelState {}
class saveProgresssucssesful extends LevelState {}
class updateLevelScoresucssesful extends LevelState {}
