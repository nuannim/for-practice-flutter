import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: SizedBox(width: 600, child: MyClock())),
      ),
    );
  }
}

class MyClock extends StatefulWidget {
  const MyClock({super.key});

  @override
  State<MyClock> createState() => _MyClockState();
}

class _MyClockState extends State<MyClock> {
  String buttontext = 'Start';
  int time = 10;
  Timer? timer;

  void _button() {
    if (buttontext == 'Start') {
      setState(() {
        buttontext = 'Clear';
      });
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          time--;
        });
        if (time == 0) {
          timer.cancel();
        }
      });
    } else {
      setState(() {
        buttontext = 'Start';
        time = 10;
        timer?.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 300,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: TweenAnimationBuilder(
                  key: ValueKey(time),
                  tween: Tween(begin: (time + 1.0) / 10.0, end: time / 10.0),
                  duration: Duration(seconds: 1),
                  builder: (_, value, _) {
                    return CircularProgressIndicator(
                      value: value,
                      backgroundColor: Colors.amber[100],
                      color: Colors.amber,
                      strokeWidth: 10,
                    );
                  },
                ),
              ),
            ),

            Positioned(child: Text('$time', style: TextStyle(fontSize: 30))),
          ],
        ),
        OutlinedButton(
          onPressed: () {
            _button();
          },
          child: Text(buttontext),
        ),
      ],
    );
  }
}
