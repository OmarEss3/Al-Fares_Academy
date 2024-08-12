import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../constants/colors.dart';
import '../constants/lists.dart';
import '../constants/routes.dart';
import '../provider/navigation_provider.dart';
import 'free_class_button.dart';
import 'links_row.dart';
import 'social_media.dart';
import 'tabs_item.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    final currentRoute = GoRouterState.of(context).uri.toString();

    int newIndex =
        tabs.indexWhere((tab) => getRouteForTab(tab) == currentRoute);
    if (newIndex != -1 && provider.selectedIndex != newIndex) {
      provider.setSelectedIndex(newIndex);
    }
  }

  String getRouteForTab(String tab) {
    switch (tab) {
      case 'Home':
        return homeRoute;
      case 'Programs':
        return programsRoute;
      case 'Fees':
        return feesRoute;
      case 'Contact Us':
        return contactUsRoute;
      case 'Our Tutors':
        return outTutorsRoute;
      case 'Comments':
        return commentsRoute;
      case 'Blogs':
        return blogsRoute;
      default:
        return '';
    }
  }

  Widget buildHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryColorDarkBlue, kPrimaryColorGray],
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          50.0), // Adjust the value to control the roundness
                      child: Image.asset(
                          'assets/images/Al-Fares Academy logo.jpg'),
                    )),
              ),
              const SocialMediaIconsRow(),
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
        GoRouter.of(context).go('$programsRoute/${programIndex + 1}');
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
    context.go(getRouteForTab(tabs[index]));
  }

  @override
  Widget build(BuildContext context) {
    return buildHeader();
  }
}
