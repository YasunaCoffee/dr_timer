import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_count_down/constants.dart';
import 'package:the_count_down/addButton.dart';
import 'package:the_count_down/iconButton.dart';

void main() {
  runApp(CountDown());
}

class CountDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kAccentColor,
        scaffoldBackgroundColor: Color(0xFF021C27),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void playSounds() {
    final player = AudioCache();
    player.play('timeup.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                FontAwesomeIcons.music,
                color: Colors.black,
              ),
              iconSize: 30.0,
              onPressed: () {
                setState(() {
                  playSounds();
                });
              })
        ],
        title: Text('Dr. TIMER',
            style: TextStyle(
                color: kTitleColor, fontFamily: 'FredokaOne', fontSize: 25.0)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '02:45',
              style: TextStyle(
                  fontSize: 60.0,
                  color: Color(0xFFF46003),
                  fontFamily: 'Roboto Mono'),
            ),
            Text(
              '45:30',
              style: TextStyle(
                  fontSize: 120.0,
                  color: Color(0xFFF46003),
                  fontFamily: 'Roboto Mono',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: addButton(setNumbers: '10', setHours: 'min'),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: addButton(setNumbers: '1', setHours: 'min'),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: addButton(setNumbers: '10', setHours: 'sec'),
                ),
              ],
            ),
            SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconButton(
                  awesomeIcon: FontAwesomeIcons.redoAlt,
                  onPressed: () {
                    setState(() {});
                  },
                ),
                iconButton(
                    awesomeIcon: FontAwesomeIcons.play,
                    onPressed: () {
                      setState(() {});
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
