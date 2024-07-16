
import 'package:flutter/material.dart';
import 'package:moyeser_academy_web/constants/routes.dart';
import 'Services/fire_base.dart';
import 'views/contact_view.dart';
import 'views/home_view.dart';
import 'views/programs_view.dart';
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await initializeFirebase();
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
        contactUsRoute:(context) => const ContactUsView(),
      },
    );
  }
}
