import 'package:flutter/material.dart';
import 'package:gym_courtes_app/models/sport.dart';
import 'package:gym_courtes_app/tabs/sport_tab.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({
    Key? key,
    required this.sports,
  }) : super(key: key);

  final List<Sport> sports;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        for (final sport in sports) SportTab(sport: sport),
      ],
    );
  }
}
