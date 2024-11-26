import '../pages/Login.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a Future to delay the navigation
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to Login page after 3 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  Login()),
      );
    });

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(147, 232, 221, 200),
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>  Login()),
              );
            },
            child: Image.asset(
              'assets/img/Log.jpg',
              width: 500,
              height: 500,
            ),
          ),
        ),
      ),
    );
  }
}