import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'links_row.dart';

class CustomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: kPrimaryColorDarkBlue,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'All rights are reserved © 2024',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          SocialMediaIconsRow(),
        ],
      ),
    );
  }
}
