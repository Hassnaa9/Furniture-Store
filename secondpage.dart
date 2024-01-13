import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/img_1.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 180),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the login page when "Log in" button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                  );
                },
                child: const Text(
                  "Log in",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the sign-up page when "Register" button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
