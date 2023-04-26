import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:math';

void main(){
  runApp(MaterialApp(
    home: Scaffold(appBar: AppBar(title: Text('Twin Dice Game'),
    backgroundColor: Color.fromARGB(255, 110, 110, 64),
    ),
    body: DiceGame(),
    ),
  ));
}

class DiceGame extends StatefulWidget{
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame>{

int leftdice = 1;
int rightdice = 2;

playSound() async {
    AudioPlayer player = AudioPlayer();
    await player.setAsset('audio/dice-142528.mp3');
    player.play();
}

rolldices(){
  setState(() {
    leftdice = Random().nextInt(6) + 1;
    rightdice = Random().nextInt(6) + 1;
    });
}

AudioPlayer player = AudioPlayer();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children:[
              Expanded(
                child: TextButton(
                  onPressed:() {
                    rolldices();
                  },
                  child: Image.asset('images/dice$leftdice.png'),
                  ),
                ),
            
              Expanded(
                child: TextButton(
                  onPressed: () {
                    rolldices();
                  },
                  child: Image.asset('images/dice$rightdice.png'),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent, //background color of button
                  side: BorderSide(width:5, color:Colors.brown), //border width and color
                  elevation: 20, //elevation of button
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(200)
                  ),
                  padding: EdgeInsets.all(30)
              ),
                  onPressed: () {
                    rolldices();
                  },
                  child: const Text(
                    'Roll',
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Lobster'),
                  ),
               )
        ],
      ),
    ),
  );
  }
}