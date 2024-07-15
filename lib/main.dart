import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moyeser_academy_web/constants/colors.dart';
import 'package:moyeser_academy_web/constants/routes.dart';
import 'views/home_view.dart';
import 'views/programs_view.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  runApp(const MyApp());
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCXmEXiQjki5vUFYVhKEAgMET9MeCwykAA",
      authDomain: "moyeser-academey.firebaseapp.com",
      projectId: "moyeser-academey",
      storageBucket: "moyeser-academey.appspot.com",
      messagingSenderId: "173191686386",
      appId: "1:173191686386:web:82df9e9d818477e2d9486b",
      measurementId: "G-37WBVB8L2M",
    ),
  );

  print('Firebase initialized successfully!');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Demo',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      home: const Scaffold(body: HomeView()),
      routes: {
        homeRoute: (context) => const HomeView(),
        '/programs': (context) => const ProgramsView(),
      },
    );
  }
}
