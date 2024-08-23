import 'package:flutter/material.dart';
import 'package:moyeser_academy_web/utils/size_config.dart';
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
          MediaQuery.sizeOf(context).width > SizeConfig.desktop
              ? buildTabs()
              : const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomMenuButton(),
                  ],
                ),
        ],
      ),
    );
  }

  Widget buildTabs() {
    return FittedBox(
      fit: BoxFit.scaleDown,
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

class CustomMenuButton extends StatelessWidget {
  const CustomMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      child: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          showMenu(
            context: context,
            position: const RelativeRect.fromLTRB(0, 80, 0, 0),
            items: [
              PopupMenuItem(
                child: const Text('Home'),
                onTap: () {
                  final provider =
                      Provider.of<NavigationProvider>(context, listen: false);
                  provider.setSelectedIndex(0);
                  context.go(homeRoute);
                },
              ),
              PopupMenuItem(
                child: const Text('Programs'),
                onTap: () async {
                  // Delay navigation to allow submenu to be shown
                  await Future.delayed(Duration(milliseconds: 100));
                  showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(0, 80, 0, 0),
                    items: [
                      for (int i = 0; i < programs.length; i++)
                        PopupMenuItem(
                          child: Text(programs[i]),
                          onTap: () {
                            final provider = Provider.of<NavigationProvider>(
                                context,
                                listen: false);
                            provider.setSelectedIndex(1);
                            context.go('$programsRoute/${i + 1}');
                          },
                        ),
                    ],
                  );
                },
              ),
              PopupMenuItem(
                child: const Text('Fees'),
                onTap: () {
                  final provider =
                      Provider.of<NavigationProvider>(context, listen: false);
                  provider.setSelectedIndex(2);
                  context.go(feesRoute);
                },
              ),
              PopupMenuItem(
                child: const Text('Contact Us'),
                onTap: () {
                  final provider =
                      Provider.of<NavigationProvider>(context, listen: false);
                  provider.setSelectedIndex(3);
                  context.go(contactUsRoute);
                },
              ),
              PopupMenuItem(
                child: const Text('Our Tutors'),
                onTap: () {
                  final provider =
                      Provider.of<NavigationProvider>(context, listen: false);
                  provider.setSelectedIndex(4);
                  context.go(outTutorsRoute);
                },
              ),
              PopupMenuItem(
                child: const Text('Comments'),
                onTap: () {
                  final provider =
                      Provider.of<NavigationProvider>(context, listen: false);
                  provider.setSelectedIndex(5);
                  context.go(commentsRoute);
                },
              ),
              PopupMenuItem(
                child: const Text('Blogs'),
                onTap: () {
                  final provider =
                      Provider.of<NavigationProvider>(context, listen: false);
                  provider.setSelectedIndex(6);
                  context.go(blogsRoute);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
