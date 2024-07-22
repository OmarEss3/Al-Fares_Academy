import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../design_pattern.dart';

class ProgramsArguments {
  final int programId;

  ProgramsArguments(this.programId);
}

class ProgramsView extends StatefulWidget {
  const ProgramsView({super.key});

  @override
  ProgramsViewState createState() => ProgramsViewState();
}

class ProgramsViewState extends State<ProgramsView>
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
      begin: const Offset(0, 1),
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
    final args = GoRouterState.of(context).extra as ProgramsArguments?;
    final programContent =
        ProgramContentFactory.getProgramContent(args?.programId ?? 0);

    return Scaffold(
     
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/program${args?.programId ?? 'default'}.jpeg',
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
                color: Colors.black54,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Text(
                          programContent.text,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        programContent.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
