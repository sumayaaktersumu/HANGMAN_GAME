import 'package:flutter/material.dart';
import 'package:hangmangame/colors.dart';
import 'package:hangmangame/figure_image.dart';
import 'package:hangmangame/game.dart';
import 'package:hangmangame/letter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  //choosing the game of word
  String word = "Sumaya".toUpperCase();
  //Create a list that contains the alphabet, or you can just copy and paste it
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text("Hangman"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                //lets make the figure

                //lets add images to the asset folder
                //now the figure will be buit accrodding to the numbwer of tries
                figureImage(Game.tries >= 0, "images/hang.png"),
                figureImage(Game.tries >= 1, "images/head.png"),
                figureImage(Game.tries >= 2, "images/body.png"),
                figureImage(Game.tries >= 3, "images/ra.png"),
                figureImage(Game.tries >= 4, "images/la.png"),
                figureImage(Game.tries >= 5, "images/rl.png"),
                figureImage(Game.tries >= 6, "images/ll.png"),
              ],
            ),
          ),

          //now we will build the hidden word widget
          //now lets go back to the game-class and add
          //a new variable to-state the selected character and check if it's on the word.

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
                .split('')
                .map((e) => letter(e.toUpperCase(),
                    !Game.selectedChar.contains(e.toUpperCase())))
                .toList(),
          ),

          //now lets build the game keyboard
          SizedBox(
            width: double.infinity,
            height: 250.0,
            child: GridView.count(
              crossAxisCount: 9,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: alphabets.map((e) {
                return RawMaterialButton(
                  onPressed: Game.selectedChar.contains(e)
                      ? null // we first check that we didn't selected the button before
                      : () {
                          setState(() {
                            Game.selectedChar.add(e);
                            print(Game.selectedChar);
                            if (!word.split('').contains(e.toUpperCase())) {
                              Game.tries++;
                            }
                          });
                          //now lets start the creating the game logic
                        },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fillColor: Game.selectedChar.contains(e)
                      ? Colors.black87
                      : Colors.blue,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
