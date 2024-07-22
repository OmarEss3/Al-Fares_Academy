import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moyeser_academy_web/views/blogs_view.dart';
import 'package:moyeser_academy_web/views/comments_view.dart';
import 'package:provider/provider.dart';
import 'Services/fire_base.dart';
import 'constants/routes.dart';
import 'provider/navigation_provider.dart';
import 'views/contact_view.dart';
import 'views/fees_view.dart';
import 'views/home_view.dart';
import 'views/out_tutors_view.dart';
import 'views/programs_view.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();

    await  initializeFirebase();

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
          path: '$programsRoute/:id',
          builder: (context, state) {
            final programId =
                int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
            return ProgramsView(programId: programId);
          },
        ),
        GoRoute(
          path: contactUsRoute,
          builder: (context, state) => const ContactUsView(),
        ),
        GoRoute(
          path: feesRoute,
          builder: (context, state) => const FeesView(),
        ),
        GoRoute(
          path: outTutorsRoute,
          builder: (context, state) => const OurTutorsView(),
        ),
        GoRoute(
          path: commentsRoute,
          builder: (context, state) => const CommentsView(),
        ),
        GoRoute(
          path: blogsRoute,
          builder: (context, state) => const BlogsView(),
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
