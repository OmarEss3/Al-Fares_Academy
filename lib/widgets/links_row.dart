import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconsRow extends StatelessWidget {
  const SocialMediaIconsRow({Key? key}) : super(key: key);

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.facebook, color: Colors.white),
          onPressed: () => _launchURL('https://www.facebook.com/profile.php?id=61564071026443&mibextid=ZbWKwL'),
        ),
        IconButton(
          icon: const Icon(FontAwesomeIcons.instagram, color: Colors.white),
          onPressed: () => _launchURL('https://www.instagram.com/alfaresacademy12?igsh=cDFiNWd6MnJoZndh'),
        ),
        IconButton(
          icon: const Icon(FontAwesomeIcons.xTwitter, color: Colors.white),
          onPressed: () => _launchURL('https://x.com/AlFaresacademy1?t=vCzGhnUole_YJPL3Y4VLqw&s=08'),
        ),
      ],
    );
  }
}