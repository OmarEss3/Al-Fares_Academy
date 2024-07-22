import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moyeser_academy_web/widgets/footer.dart';
import 'package:moyeser_academy_web/widgets/header_widget.dart';

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
  
  @override
  Widget build(BuildContext context) {
    final args = GoRouterState.of(context).extra as ProgramsArguments?;
    final programContent =
        ProgramContentFactory.getProgramContent(args?.programId ?? 0);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            Stack(
              children: [
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 2.0,
                            blurRadius: 5.0,
                          ),
                        ]),
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.all(16),
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
              ],
            ),
            CustomFooter(),
          ],
        ),
      ),
    );
  }
}
