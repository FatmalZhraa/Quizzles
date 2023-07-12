import 'package:exam/models/levels.dart';
import 'package:flutter/material.dart';
class LevelView extends StatefulWidget {
  final Level level;
  final ValueChanged<int> onScoreChanged;

  LevelView({required this.level, required this.onScoreChanged});

  @override
  _LevelViewState createState() => _LevelViewState();
}

class _LevelViewState extends State<LevelView> {
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level ${widget.level.number}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Score: $_score'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _score += 3;
                });
              },
              child: Text('Add 3 to score'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.onScoreChanged(_score);
                Navigator.pop(context);
              },
              child: Text('Finish level'),
            ),
          ],
        ),
      ),
    );
  }
}
