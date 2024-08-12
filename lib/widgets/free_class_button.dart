import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moyeser_academy_web/constants/routes.dart';
import 'package:provider/provider.dart';
import '../provider/navigation_provider.dart';

class FreeClassButton extends StatelessWidget {
  const FreeClassButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Provider.of<NavigationProvider>(context, listen: false)
              .setSelectedIndex(3);
          GoRouter.of(context).go(contactUsRoute);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromARGB(255, 14, 32, 69),
          ),
          height: 40,
          width: 200,
          child: const Center(
            child: Text(
              'Get a free class',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
