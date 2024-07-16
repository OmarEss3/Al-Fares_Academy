import 'package:flutter/material.dart';
import 'package:moyeser_academy_web/widgets/header_widget.dart';

import '../widgets/user_form.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderWidget(),
              Stack(
                children: [
                  Container(
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
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Contact Us',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'For any questions or inquiries, please contact us at the following numbers:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.phone, color: Colors.blue),
                            SizedBox(width: 10),
                            Text('(123) 456-7890'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    // const UserForm(
                    //   userForm: false,
                    // ),
                    Image.asset('assets/images/callCener.jpeg')
                  ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
