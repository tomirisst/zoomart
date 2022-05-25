import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoomart/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:zoomart/presentation/services/api_manager.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform
    // options: FirebaseOptions(
    // apiKey: "AIzaSyCCeuR7rxVqlnXVdQhti4V6UOOU510UpOc",
    // appId: "1:449679109705:android:50b98cde25cb4638155998",
    // messagingSenderId: "449679109705",
    // projectId: "zoomart-30f24",),
  );
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
