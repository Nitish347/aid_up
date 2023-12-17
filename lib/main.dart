import 'package:aid_up/Screens/DonateDetail.dart';
import 'package:aid_up/Screens/DonateMoneyScreen.dart';
import 'package:aid_up/Screens/DonationScreen.dart';
import 'package:aid_up/Screens/HomeScreen.dart';
import 'package:aid_up/Screens/TeachScreen.dart';
import 'package:aid_up/Screens/signup/CreateAccount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      home: CreateAccount(),
    );
  }
}
