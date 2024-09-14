import 'package:flutter/material.dart';
import '../design_pattern.dart';
import '../utils/app_style.dart';
import '../utils/size_config.dart';
import '../widgets/footer.dart';
import '../widgets/header_widget.dart';

class ProgramsView extends StatefulWidget {
  final int programId;

  const ProgramsView({super.key, required this.programId});

  @override
  ProgramsViewState createState() => ProgramsViewState();
}

class ProgramsViewState extends State<ProgramsView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final programContent =
        ProgramContentFactory.getProgramContent(widget.programId);
    final List<Widget> destoptView = [
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
    ];
    final List<Widget> mobileView = [
      Expanded(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned.fill(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(
                        0.6), // Adjust the opacity to lighten the image
                    BlendMode
                        .srcATop, // Blends the white color on top of the image to lighten it
                  ),
                  child: Image.asset(
                    programContent.imagePath,
                    fit: BoxFit
                        .cover, // Ensures the image covers the entire background
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                    16.0), // Optional: Add padding to the text
                child: Text(programContent.text,
                    style: AppStyle.styleRegular16(context)),
              ),
            ],
          ),
        ),
      ),
    ];

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
                      children:
                          MediaQuery.sizeOf(context).width > SizeConfig.tablet
                              ? destoptView
                              : mobileView,
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
