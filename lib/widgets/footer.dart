import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.blueGrey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'All rights are reservred © 2024 ',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.white),
                onPressed: () {
                  // Add your Facebook link here
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.twitter, color: Colors.white),
                onPressed: () {
                  // Add your Twitter link here
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.linkedin, color: Colors.white),
                onPressed: () {
                  // Add your LinkedIn link here
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
