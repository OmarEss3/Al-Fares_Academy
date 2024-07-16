import 'package:flutter/material.dart';
import 'package:moyeser_academy_web/constants/colors.dart';
import 'package:moyeser_academy_web/constants/routes.dart';
import '../constants/lists.dart';
import '../widgets/footer.dart';
import '../widgets/free_class_button.dart';
import '../widgets/header_widget.dart';
import '../widgets/info_section.dart';
import '../widgets/social_media.dart';
import '../widgets/tabs_item.dart';
import '../widgets/user_form.dart';
import 'programs_view.dart';

int selectedIndex = 0;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            // Expanded(child: AnimatedBackgroundAndText()),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const InfoSection(),
            ),

            CustomFooter(),
            // const UserForm(),
          ],
        ),
      ),
    );
  }
}

class AnimatedBackgroundAndText extends StatefulWidget {
  const AnimatedBackgroundAndText({super.key});

  @override
  _AnimatedBackgroundAndTextState createState() =>
      _AnimatedBackgroundAndTextState();
}

class _AnimatedBackgroundAndTextState extends State<AnimatedBackgroundAndText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 3),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/8.jpeg', // Replace with your background image
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.5),
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
                Center(
                  child: SlideTransition(
                    position: _animation,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: const Column(
                        children: [
                          Text(
                            'Welcome to Moyeser Academy ',
                            style: TextStyle(
                              fontSize: 40, // Adjusted font size
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'for teaching Quran',
                            style: TextStyle(
                              fontSize: 30, // Adjusted font size
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'The Messenger of Allah (PBUH) said “The best of you are the ones who learn the Quran and teach it to others” (Bukhari)',
                            style: TextStyle(
                              fontSize: 20, // Adjusted font size
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
