import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ConfettiController _centerController;

  @override
  void initState() {
    super.initState();
    _centerController =
        ConfettiController(duration: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _centerController.dispose();
    super.dispose();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          bottom: false,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    _centerController.play();
                  },
                  child: Text(
                    "Let's party",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _centerController,
                  blastDirection: 360,
                  maxBlastForce: 5,
                  minBlastForce: 3,
                  emissionFrequency: 0.3,
                  numberOfParticles: 10,
                  gravity: 0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
