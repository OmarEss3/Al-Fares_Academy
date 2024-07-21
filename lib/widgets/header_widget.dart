import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/lists.dart';
import '../constants/routes.dart';
import '../provider/navigation_provider.dart';
import '../views/programs_view.dart';
import 'free_class_button.dart';
import 'social_media.dart';
import 'tabs_item.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  Widget buildHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryColorGreen, kPrimaryColorGray],
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(
                  height: 100,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              const SocialMedia(),
              const FreeClassButton(),
            ],
          ),
          const SizedBox(height: 12),
          buildTabs(),
        ],
      ),
    );
  }

  Widget buildTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 5),
          for (int i = 0; i < tabs.length; i++)
            i == 1 ? buildPopupMenu(i) : buildTabItem(i),
          const SizedBox(width: 5),
        ],
      ),
    );
  }

  Widget buildPopupMenu(int index) {
    return PopupMenuButton<int>(
      onSelected: (int programIndex) {
        Provider.of<NavigationProvider>(context, listen: false)
            .setSelectedIndex(index);
        Navigator.pushNamed(
          context,
          '/programs',
          arguments: ProgramsArguments(programIndex + 1),
        );
      },
      itemBuilder: (BuildContext context) {
        return List.generate(6, (programIndex) {
          return PopupMenuItem<int>(
            value: programIndex,
            child: Text(programs[programIndex]),
          );
        });
      },
      child: Row(
        children: [
          Consumer<NavigationProvider>(
            builder: (context, provider, child) {
              return TabsItem(
                text: tabs[index],
                isSelected: provider.selectedIndex == index,
              );
            },
          ),
          const SizedBox(width: 100),
        ],
      ),
    );
  }

  Widget buildTabItem(int index) {
    return Row(
      children: [
        Consumer<NavigationProvider>(
          builder: (context, provider, child) {
            return TabsItem(
              text: tabs[index],
              isSelected: provider.selectedIndex == index,
              onTap: () => onItemTapped(index),
            );
          },
        ),
        const SizedBox(width: 100),
      ],
    );
  }

  void onItemTapped(int index) {
    Provider.of<NavigationProvider>(context, listen: false)
        .setSelectedIndex(index);
    switch (tabs[index]) {
      case 'Home':
        Navigator.of(context)
            .pushNamedAndRemoveUntil(homeRoute, (route) => false);
        break;
      case 'Programs':
        // Handle separately with PopupMenu
        break;
      case 'Fees':
      case 'Contact Us':
        Navigator.of(context)
            .pushNamedAndRemoveUntil(contactUsRoute, (route) => false);
        break;
      case 'Our Tutors':
      case 'Comment':
      case 'Blog':
        // Add routing for these as needed
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildHeader();
  }
}
