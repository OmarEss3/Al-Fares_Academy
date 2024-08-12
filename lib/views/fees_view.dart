import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moyeser_academy_web/constants/colors.dart';
import 'package:moyeser_academy_web/constants/variables.dart';
import 'package:moyeser_academy_web/widgets/footer.dart';
import 'package:moyeser_academy_web/widgets/header_widget.dart';
import 'package:provider/provider.dart';

import '../constants/routes.dart';
import '../provider/navigation_provider.dart';

class FeesView extends StatelessWidget {
  const FeesView({super.key});

  Widget buildPriceCard({
    required BuildContext context,
    required String header,
    required String priceGBP,
    required String priceUSD,
    required String classesPerMonth,
    required String hoursPerMonth,
  }) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              header,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Text(priceGBP,
                style: const TextStyle(fontSize: 16, color: Colors.black54)),
            Text(priceUSD,
                style: const TextStyle(fontSize: 16, color: Colors.black54)),
            const SizedBox(height: 8),
            Text(classesPerMonth,
                style: const TextStyle(fontSize: 14, color: Colors.black54)),
            Text(hoursPerMonth,
                style: const TextStyle(fontSize: 14, color: Colors.black54)),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColorDarkBlue,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Provider.of<NavigationProvider>(context, listen: false)
                    .setSelectedIndex(0); // Example index for Contact Us
                context.go(contactUsRoute);
              },
              child: const Text('Contact Us',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeaderWidget(),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        '30 MINS CLASS',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      feesTextWidget(
                        text:
                            'Moyeser Academy offers affordable fees for all students. Payment is done in advance at the beginning of every month, through easy payment methods.',
                      ),
                      feesTextWidget(
                        text:
                            'Students pay £7 (\$9) per 1 hour if they take 4 hours or less per month.',
                      ),
                      feesTextWidget(
                        text:
                            'Students pay £6 (\$8) per 1 hour if they take 6 or 8 hours per month.',
                      ),
                      feesTextWidget(
                        text:
                            'Students pay £5.50 (\$7.50) per 1 hour if they take 10 hours per month.',
                      ),
                      feesTextWidget(
                        text:
                            'Students pay £5 (\$7) per 1 hour if they take more than 12 hours per month.',
                      ),
                      feesTextWidget(
                          text:
                              'Students can choose one of the following plans to suit their personal schedule.')
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  buildPriceCard(
                    context: context,
                    header: '1 class / week',
                    priceGBP: '£14',
                    priceUSD: '\$18',
                    classesPerMonth: '4 classes / month',
                    hoursPerMonth: '2 Hrs / month',
                  ),
                  buildPriceCard(
                    context: context,
                    header: '2 classes / week',
                    priceGBP: '£28',
                    priceUSD: '\$36',
                    classesPerMonth: '8 classes / month',
                    hoursPerMonth: '4 Hrs / month',
                  ),
                  buildPriceCard(
                    context: context,
                    header: '3 classes / week',
                    priceGBP: '£36',
                    priceUSD: '\$48',
                    classesPerMonth: '12 classes / month',
                    hoursPerMonth: '6 Hrs / month',
                  ),
                  buildPriceCard(
                    context: context,
                    header: '4 classes / week',
                    priceGBP: '£48',
                    priceUSD: '\$64',
                    classesPerMonth: '16 classes / month',
                    hoursPerMonth: '8 Hrs / month',
                  ),
                  buildPriceCard(
                    context: context,
                    header: '5 classes / week',
                    priceGBP: '£55',
                    priceUSD: '\$75',
                    classesPerMonth: '20 classes / month',
                    hoursPerMonth: '10 Hrs / month',
                  ),
                  buildPriceCard(
                    context: context,
                    header: '1 class / week (1 Hour)',
                    priceGBP: '£28',
                    priceUSD: '\$36',
                    classesPerMonth: '4 classes / month',
                    hoursPerMonth: '4 Hrs / month',
                  ),
                  buildPriceCard(
                    context: context,
                    header: '2 classes / week (1 Hour)',
                    priceGBP: '£48',
                    priceUSD: '\$64',
                    classesPerMonth: '8 classes / month',
                    hoursPerMonth: '8 Hrs / month',
                  ),
                  buildPriceCard(
                    context: context,
                    header: '3 classes / week (1 Hour)',
                    priceGBP: '£60',
                    priceUSD: '\$84',
                    classesPerMonth: '12 classes / month',
                    hoursPerMonth: '12 Hrs / month',
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Center(
                child: Text(
                  '1 HOUR CLASS',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  buildPriceCard(
                    context: context,
                    header: '1 class / week',
                    priceGBP: '£28',
                    priceUSD: '\$36',
                    classesPerMonth: '4 classes / month',
                    hoursPerMonth: '4 Hrs / month',
                  ),
                  buildPriceCard(
                    context: context,
                    header: '2 classes / week',
                    priceGBP: '£48',
                    priceUSD: '\$64',
                    classesPerMonth: '8 classes / month',
                    hoursPerMonth: '8 Hrs / month',
                  ),
                  buildPriceCard(
                    context: context,
                    header: '3 classes / week',
                    priceGBP: '£60',
                    priceUSD: '\$84',
                    classesPerMonth: '12 classes / month',
                    hoursPerMonth: '12 Hrs / month',
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: const Column(
                  children: [
                    feesTextWidget(
                      text:
                          'We can offer you a customized plan to suit your schedule. Choose the number and duration of the classes as you wish. Please contact us or email us at: $kEmail',
                    ),
                    feesTextWidget(
                        text:
                            'Refund Policy: The student may at any time during the month request to stop classes and the academy shall refund him with the fees of the classes that have not been given.'),
                  ],
                ),
              ),
              const SizedBox(height: 64),
              CustomFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class feesTextWidget extends StatelessWidget {
  const feesTextWidget({
    required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
    );
  }
}
