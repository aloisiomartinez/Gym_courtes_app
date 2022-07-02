import 'package:flutter/material.dart';
import 'package:gym_courtes_app/resources/strings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text(Strings.profile));
  }
}