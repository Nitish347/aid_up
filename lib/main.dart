import 'package:aid_up/NGO/Screens/DonationCamp.dart';
import 'package:aid_up/Volunteer/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'NGO/Screens/NGOHome.dart';
import 'NGO/Screens/TeachingCamp.dart';
import 'Volunteer/Screens/Profile.dart';
import 'Volunteer/Screens/signup/CreateAccount.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DonationCamp(),
    );
  }
}
