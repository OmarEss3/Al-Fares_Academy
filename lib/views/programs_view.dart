import 'package:flutter/material.dart';

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
      begin: Offset(0, 1),
      end: Offset(0, 0),
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
    final ProgramsArguments args =
        ModalRoute.of(context)!.settings.arguments as ProgramsArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Program ${args.programId}'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/program${args.programId}.jpg', // Use different images for each program
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Center(
            child: SlideTransition(
              position: _animation,
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.black54,
                child: Text(
                  'Content for Program ${args.programId}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
