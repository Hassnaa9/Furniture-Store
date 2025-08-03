import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/login.dart';
import 'features/forgot_password.dart';
import 'signup.dart';
import 'splash.dart';
import 'secondpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDF2YnA_sYswBDJ_SYyow4IQPCSUkCmwpo",
      appId: "1:333710136321:android:d00c8326f669abfa3f9c00",
      messagingSenderId: "333710136321",
      projectId: "login-6414b",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyProject(),
    );
  }
}

