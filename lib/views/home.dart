import 'package:exam/bloc/level_cubit.dart';
import 'package:exam/components/default_button.dart';
import 'package:exam/views/levels.dart';
import 'package:exam/views/ui_level.dart';
import 'package:flutter/material.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,
        color: Colors.deepPurple.shade900,
          child: Column(
            children: [
              Icon(
                Icons.lightbulb_outlined,
                color: Colors.deepOrange,
                size: 200, // specify the size of the icon
              ),
              SizedBox(width: 20,),
              Text("Quizzles",style: TextStyle(fontSize: 50,color: Colors.tealAccent)),
              SizedBox(height: 20,),
              Text("Let 's play !",style: TextStyle(fontSize: 35,color: Colors.white)),
              SizedBox(height: 5,),
              Text("Play now and level up",style: TextStyle(fontSize: 20,color: Colors.white)),
              SizedBox(height: 45,),
              DefaultButton(text: 'Play Now',onPress: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LevelsScreen()),);
              },),

              SizedBox(height: 20,),
              DefaultButton(text: 'About',onPress: (){},)

            ],
          )),);
  }
}
