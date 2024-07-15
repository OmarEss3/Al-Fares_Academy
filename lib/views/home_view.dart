import 'package:flutter/material.dart';
import 'package:moyeser_academy_web/constants/colors.dart';
import 'package:moyeser_academy_web/constants/routes.dart';
import '../constants/lists.dart';
import '../widgets/footer.dart';
import '../widgets/free_class_button.dart';
import '../widgets/info_section.dart';
import '../widgets/social_media.dart';
import '../widgets/tabs_item.dart';
import '../widgets/user_form.dart';
import 'programs_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<String> _tabs = [
    'Home',
    'Programs',
    'Fees',
    'Contact Us',
    'Our Tutors',
    'Comment',
    'Blog',
  ];

  @override
  void initState() {
    super.initState();
    // Any heavy initializations can go here
  }

  @override
  void dispose() {
    // Dispose of controllers and other resources
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_tabs[index]) {
      case 'Home':
        Navigator.pushNamed(context, homeRoute);
        break;
      case 'Programs':
        // Handle separately with PopupMenu
        break;
      case 'Fees':
      case 'Contact Us':
      case 'Our Tutors':
      case 'Comment':
      case 'Blog':
        // Add routing for these as needed
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),
          const Expanded(child: AnimatedBackgroundAndText()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryColorGreen, kPrimaryColorGray],
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(
                  height: 100,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              const SocialMedia(),
              const FreeClassButton(),
            ],
          ),
          const SizedBox(height: 12),
          _buildTabs(),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 5),
          for (int i = 0; i < _tabs.length; i++)
            i == 1 ? _buildPopupMenu(i) : _buildTabItem(i),
          const SizedBox(width: 5),
        ],
      ),
    );
  }

  Widget _buildPopupMenu(int index) {
    return PopupMenuButton<int>(
      onSelected: (int programIndex) {
        setState(() {
          _selectedIndex = index;
        });
        Navigator.pushNamed(
          context,
          '/programs',
          arguments: ProgramsArguments(programIndex + 1),
        );
      },
      itemBuilder: (BuildContext context) {
        return List.generate(6, (programIndex) {
          return PopupMenuItem<int>(
            value: programIndex,
            child: Text(programs[programIndex]),
          );
        });
      },
      child: Row(
        children: [
          TabsItem(
            text: _tabs[index],
            isSelected: _selectedIndex == index,
          ),
          const SizedBox(width: 100),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index) {
    return Row(
      children: [
        TabsItem(
          text: _tabs[index],
          isSelected: _selectedIndex == index,
          onTap: () => _onItemTapped(index),
        ),
        const SizedBox(width: 100),
      ],
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
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const InfoSection(),
            ),
            const UserForm(),
            CustomFooter()
          ],
        ),
      ),
    );
  }
}
