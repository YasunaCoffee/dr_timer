import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_count_down/constants.dart';
import 'package:the_count_down/addButton.dart';
import 'package:the_count_down/iconButton.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:simple_timer/simple_timer.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int current = 20;

  TimerController _timerController;
  TimerStyle _timerStyle = TimerStyle.ring;
  TimerProgressIndicatorDirection _progressIndicatorDirection =
      TimerProgressIndicatorDirection.clockwise;
  TimerProgressTextCountDirection _progressTextCountDirection =
      TimerProgressTextCountDirection.count_down;

  @override
  void initState() {
    _timerController = TimerController(this);
    super.initState();
  }

  var alertStyle = AlertStyle(
    backgroundColor: Colors.white54,
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.start,
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
      side: BorderSide(
        color: kAccentColor,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.white,
    ),
    alertAlignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                FontAwesomeIcons.volumeUp,
                color: Colors.black,
              ),
              iconSize: 30.0,
              onPressed: () {
                setState(() {
                  Alert(
                    style: alertStyle,
                    context: context,
                    image: Image.asset("assets/sound.png"),
                    title: "SOUND CHECKER",
                    desc: "Check your alert volume!",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                        color: kAccentColor,
                      )
                    ],
                  ).show();
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
            Container(
              padding: EdgeInsets.all(30.0),
              child: SimpleTimer(
                duration: Duration(seconds: current),
                controller: _timerController,
                timerStyle: _timerStyle,
                onStart: handleTimerOnStart,
                onEnd: handleTimerOnEnd,
                valueListener: timerValueChangeListener,
                backgroundColor: kCountButtonColor,
                progressIndicatorColor: kAccentColor,
                progressIndicatorDirection: _progressIndicatorDirection,
                progressTextCountDirection: _progressTextCountDirection,
                progressTextStyle: TextStyle(color: kAccentColor),
                strokeWidth: 10.0,
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: addButton(
                    setNumbers: '10',
                    setHours: 'min',
                    onPressed: () {
                      setState(() {});
                    },
                  ),
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
                  child: addButton(
                    setNumbers: '10',
                    setHours: 'sec',
                    onPressed: () {
                      _timerController.reset();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconButton(
                  awesomeIcon: FontAwesomeIcons.redoAlt,
                  onPressed: () {
                    setState(() {
                      _timerController.reset();
                    });
                  },
                ),
                iconButton(
                    awesomeIcon: FontAwesomeIcons.play,
                    onPressed: () {
                      setState(() {
                        print('play');
                        _timerController.start();
                      });
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _setCountDirection(TimerProgressTextCountDirection countDirection) {
    setState(() {
      _progressTextCountDirection = countDirection;
    });
  }

  void _setProgressIndicatorDirection(
      TimerProgressIndicatorDirection progressIndicatorDirection) {
    setState(() {
      _progressIndicatorDirection = progressIndicatorDirection;
    });
  }

  void _setStyle(TimerStyle timerStyle) {
    setState(() {
      _timerStyle = timerStyle;
    });
  }

  void timerValueChangeListener(Duration timeElapsed) {}

  void handleTimerOnStart() {
    print("timer has just started");
  }

  void handleTimerOnEnd() {
    print("timer has ended");
  }
}
