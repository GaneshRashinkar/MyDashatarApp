import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var colors = [
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.black,
    Colors.white,
    Colors.grey,
    Colors.green,
    Colors.purple
  ];
  List<String> sounds = ["Kick.wav", "Ride.wav", "Snare.wav", "Tom.wav"];
  var player = AudioPlayer();
  var random = Random();
  Color appBarColor = Colors.yellow;
  Color scafoldColor = Colors.blue;
  var audioFile = "Kick.wav";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: scafoldColor,
        appBar: AppBar(
          title: IconButton(
            onPressed: () {
              var audioIndex = random.nextInt(sounds.length);
              audioFile = sounds[audioIndex];
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.blue,
            ),
          ),
          centerTitle: true,
          backgroundColor: appBarColor,
        ),
        body: Center(
          child: MaterialButton(
            onPressed: () {
              var appBarIndex = random.nextInt(colors.length);
              var scafoldIndex = random.nextInt(colors.length);

              player.play(AssetSource(audioFile));
              setState(() {
                appBarColor = colors[appBarIndex];
                scafoldColor = colors[scafoldIndex];
              });
            },
            child: Image.asset("images/dash.png"),
          ),
        ),
      ),
    );
  }
}
