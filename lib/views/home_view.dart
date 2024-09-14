import 'package:flutter/material.dart';
import '../utils/app_style.dart';
import '../widgets/footer.dart';
import '../widgets/header_widget.dart';
import '../widgets/info_section.dart';
import '../widgets/user_form.dart';
import 'package:video_player/video_player.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  late ScrollController _scrollController;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller = VideoPlayerController.asset('assets/videos/Comp.webm')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const HeaderWidget(),
              const AnimatedBackgroundAndText(),
              _controller.value.isInitialized
                  ? Stack(
                      alignment: Alignment.center, // Center the button
                      children: [
                        AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                        IconButton(
                          iconSize: 64,
                          color: Colors.white,
                          icon: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_filled,
                          ),
                          onPressed: () {
                            setState(() {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },
                        ),
                      ],
                    )
                  : const CircularProgressIndicator(),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const InfoSection(),
              ),
              const UserForm(freeClssTxt: true),
              CustomFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedBackgroundAndText extends StatefulWidget {
  const AnimatedBackgroundAndText({super.key});

  @override
  AnimatedBackgroundAndTextState createState() =>
      AnimatedBackgroundAndTextState();
}

class AnimatedBackgroundAndTextState extends State<AnimatedBackgroundAndText>
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
    return Stack(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to Al-Fares Academy ',
                    style: AppStyle.styleBold40(context),
                  ),
                  Text(
                    'for teaching Quran',
                    style: AppStyle.styleBold30(context),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'The Messenger of Allah (PBUH) said “The best of you are the ones who learn the Quran and teach it to others” (Bukhari)',
                    style: AppStyle.styleBold20(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
