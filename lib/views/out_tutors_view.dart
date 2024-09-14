import 'package:flutter/material.dart';
import '../models/tutor_model.dart';
import '../widgets/footer.dart';
import '../widgets/header_widget.dart';
import '../widgets/tutor_card_widget.dart';

class OurTutorsView extends StatelessWidget {
  final List<TutorModel> tutors = [
    TutorModel(
        name: "Fares El-Saeed Ahmed",
        description:
            "A graduate of the Faculty of Medicine at Al-Azhar University and a teacher of the Holy Quran and Arabic language for non-Arabs with more than three years of experience. Studied at the Institute of Quranic Recitations at Al-Azhar University and holds Quranic licenses (Ijaza) from the highest Egyptian sheikhs including Sheikh Abdel Fattah Madkour, former head of the Egyptian Recitations and the highest chain of transmission in the narration of Imam Hafs from Asim Sheikh / Hafez Mahmoud Al-Sanea Sheikha / Tanazer Mustafa Al-Najouli Sheikh / Moamen Al-Khaliji. Specializes in establishing the Arabic language for non-native speakers through the Noorani Qaida and explaining Tajweed in English. Lecturer at the Moyesser Academy for qualifying male and female teachers to teach non-Arabs.",
        image: "assets/images/faresImage.jpg"),
  ];

  OurTutorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Tutors',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  // Display the list of tutors directly
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: tutors.length,
                    itemBuilder: (context, index) {
                      return TutorCard(
                          tutor: tutors[index]); // Create cards for tutors
                    },
                  ),
                ],
              ),
            ),
            Positioned(bottom: 0, child: CustomFooter()), // Footer widget
          ],
        ),
      ),
    );
  }
}
