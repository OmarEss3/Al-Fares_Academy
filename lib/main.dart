import 'package:flutter/material.dart';
import 'package:moyeser_academy_web/views/fees_view.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'constants/routes.dart';
import 'provider/navigation_provider.dart';
import 'views/contact_view.dart';
import 'views/home_view.dart';
import 'views/programs_view.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await initializeFirebase();
  runApp(
    ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: homeRoute,
      routes: [
        GoRoute(
          path: homeRoute,
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: '/programs',
          builder: (context, state) => const ProgramsView(),
        ),
        GoRoute(
          path: contactUsRoute,
          builder: (context, state) => const ContactUsView(),
        ),
        GoRoute(
          path: feesRoute,
          builder: (context, state) =>
              const FeesView(), // Add the new pricing page route
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Moyeser Academy',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      routerConfig: router,
    );
  }
}
