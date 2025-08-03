import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'secondpage.dart';

class MyProject extends StatefulWidget {
  @override
  _MyProjectState createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Row(
        children: [
          Icon(
            Icons.chair,
            size: 100,
            color: Colors.white,
          ),
          Text(
            'Decor Hive',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xFFD7CCC8),
      nextScreen: SecondPage(),
      splashIconSize: 50,
      duration: 4000,
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
