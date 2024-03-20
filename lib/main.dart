import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gvm_app/forms/listpage.dart';
import 'package:gvm_app/forms/registration.dart';
import 'package:gvm_app/startingScreen/loginScreen.dart';
import 'package:gvm_app/startingScreen/onboarding_screen.dart';

import 'Dashboard/Dashboard_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAhWGY_nmjO8Tt8B5vnOqjkbP4Sh19oRWo",
              appId: "1:760064406384:android:f7f0deb8682f6b352795b5",
              messagingSenderId: "760064406384",
              projectId: "gvm-project-d48af",
              storageBucket: 'gvm-project-d48af.appspot.com'),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GVM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: OnboardingScreen(),
      initialRoute: OnboardingScreen.id,
      routes: {
        OnboardingScreen.id: (context) => const OnboardingScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        DashboardScreen.id: (context) => const DashboardScreen(),
        Registration.id: (context) => const Registration(),
        ListPages.id: (context) => const ListPages(),
      },
    );
  }
}
