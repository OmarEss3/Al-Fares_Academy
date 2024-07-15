import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.facebook,
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Icon(
              FontAwesomeIcons.instagram,
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Icon(
              FontAwesomeIcons.whatsapp,
              color: Colors.white,
            ),
          ],
        ),
        Text(
          'email@gmail.com',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
