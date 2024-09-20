import 'package:al_fares_academy/views/not_found_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'Services/fire_base.dart';
import 'constants/routes.dart';
import 'provider/navigation_provider.dart';
import 'views/blogs_view.dart';
import 'views/comments_view.dart';
import 'views/contact_view.dart';
import 'views/fees_view.dart';
import 'views/home_view.dart';
import 'views/out_tutors_view.dart';
import 'views/programs_view.dart';
import 'widgets/adaptive_layout_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeFirebase();
  runApp(
    ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: AdaptiveLayout(
          mobileLayout: (context) => const DesktopLayout(),
          tabletLayout: (context) => const DesktopLayout(),
          desktopLayout: (context) => const DesktopLayout()),
    ),
  );
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      
      initialLocation: homeRoute,
      errorPageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const NotFoundPage(),
        );
      },
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
          builder: (context, state) => OurTutorsView(),
        ),
        GoRoute(
          path: commentsRoute,
          builder: (context, state) => const CommentsView(),
        ),
        GoRoute(
          path: blogsRoute,
          builder: (context, state) => const BlogsView(),
        ),
      ],routerNeglect: false,
      
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Al-Fares Academy',
      theme: ThemeData(
        fontFamily: 'Merriweather',
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      routerConfig: router,
    );
  }
}
