import 'package:flutter/material.dart';
import 'package:gym_courtes_app/models/sport.dart';
import 'package:gym_courtes_app/pages/calendar_page.dart';
import 'package:gym_courtes_app/pages/profile_page.dart';
import 'package:gym_courtes_app/pages/ranking_page.dart';
import 'package:gym_courtes_app/pages/sports_page.dart';
import 'package:gym_courtes_app/resources/images.dart';
import 'package:gym_courtes_app/resources/strings.dart';

class SportsGym extends StatefulWidget {
  const SportsGym({
    Key? key,
    required this.onThemeModePressed,
  }) : super(key: key);

  final VoidCallback onThemeModePressed;

  @override
  _SportsGymState createState() => _SportsGymState();
}

class _SportsGymState extends State<SportsGym> {
  final pageController = PageController();
  int currentPage = 0;

  final sports = const [
    Sport(
        name: Strings.football,
        icon: Icons.sports_football,
        cover: Images.football),
    Sport(
        name: Strings.basketball,
        icon: Icons.sports_basketball,
        cover: Images.basketball),
    Sport(name: Strings.hockey, icon: Icons.sports_hockey, cover: Images.hockey)
  ];

  // final tabs = const [
  //   Tab(icon: Icon(Icons.sports_football)),
  //   Tab(icon: Icon(Icons.sports_hockey)),
  //   Tab(icon: Icon(Icons.sports_basketball))
  // ];

  void onItemPressed(int index) {
    pageController.jumpToPage(index);
    // pageController.animateToPage(
    //   index,
    //   duration: const Duration(milliseconds: 400),
    //   curve: Curves.bounceInOut,
    // );
    setState(() {
      currentPage = index;
    });
  }

  void onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: sports.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appName),
          actions: [
            IconButton(
              onPressed: widget.onThemeModePressed,
              icon: Icon(
                theme.brightness == Brightness.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
            )
          ],
          bottom: currentPage == 0
              ? TabBar(
                  tabs: sports
                      .map((sport) => Tab(icon: Icon(sport.icon)))
                      .toList(),
                  indicatorPadding:
                      const EdgeInsets.symmetric(horizontal: 20.0),
                )
              : null,
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
          children: [
            SportsPage(sports: sports),
            const RankingPage(),
            const CalendarPage(),
            const ProfilePage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 2.0,
          onPressed: () {},
          child: const Icon(Icons.share),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            currentIndex: currentPage,
            onTap: onItemPressed,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: Strings.sports,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: Strings.ranking,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: Strings.calendar,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: Strings.profile,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
