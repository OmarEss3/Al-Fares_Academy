
import 'package:flutter/material.dart';
import 'info_item.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoItem(
          icon: Icons.school,
          text:
              'Fajr Al-Quran Academy is an online Arab Egyptian Academy that teaches Quran, Islamic studies, and Arabic language for all ages and all levels. We are based in Egypt and our tutors are highly qualified Egyptian Azhary teachers.',
        ),
        SizedBox(height: 16.0),
        InfoItem(
          icon: Icons.language,
          text:
              'No matter where you are around the world, you can join us and enjoy our professional and beneficial online classes. We aim to create a professional learning environment and make the learning process interesting and enjoyable.',
        ),
        SizedBox(height: 16.0),
        InfoItem(
          icon: Icons.people,
          text:
              'We have male teachers to teach male adult students and female teachers to teach female adult students. Children can be taught by male or female teachers.',
        ),
        SizedBox(height: 16.0),
        InfoItem(
          icon: Icons.child_care,
          text:
              'We have special and interesting courses for kids that include enjoyable activities and games. The courses are led by teachers highly trained to make kids retain information and stay engaged all the time.',
        ),
        SizedBox(height: 16.0),
        InfoItem(
          icon: Icons.schedule,
          text:
              'Our schedules are flexible as we deliver 24/7 classes so that you can choose the times and duration of the classes that suit your personal schedule.',
        ),
        SizedBox(height: 16.0),
        InfoItem(
          icon: Icons.card_giftcard,
          text:
              'We grant free certificates for students who finish certain levels in all programmes.',
        ),
      ],
    );
  }
}
