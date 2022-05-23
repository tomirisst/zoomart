import 'package:flutter/material.dart';
import 'package:zoomart/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:zoomart/presentation/services/api_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(),
    );
  }
}
