import 'package:flutter/material.dart';
import 'package:moyeser_academy_web/constants/variables.dart';
import 'package:moyeser_academy_web/widgets/footer.dart';
import 'package:moyeser_academy_web/widgets/header_widget.dart';
import '../constants/colors.dart';
import '../widgets/user_form.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 2.0,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Register now and get your free trial class.',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Kindly fill in the given form with the required information or contact us on our email and WhatsApp below. We will get back to you shortly:',
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone, color: kPrimaryColorDarkBlue),
                          const SizedBox(width: 10),
                          const Text(kPhoneNumber),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.email, color: kPrimaryColorDarkBlue),
                          const SizedBox(width: 10),
                          const Text(kEmail),
                        ],
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: UserForm(freeClssTxt: false),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Image.asset(
                          'assets/images/callCener.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomFooter(),
          ],
        ),
      ),
    );
  }
}
