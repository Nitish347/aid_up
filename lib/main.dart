import 'package:aid_up/Firestore/FirestoreData.dart';
import 'package:aid_up/NGO/Screens/DonationCamp.dart';
import 'package:aid_up/Volunteer/Screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'NGO/Screens/Address.dart';
import 'NGO/Screens/MoneyDoinationNGO.dart';
import 'NGO/Screens/NGOHome.dart';
import 'NGO/Screens/TeachingCamp.dart';
import 'Volunteer/Screens/Profile.dart';
import 'Volunteer/Screens/signup/CreateAccount.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data != null) {
                FirestoreData.userData(context, FirebaseAuth.instance.currentUser!.uid.toString());
                return HomeScreen();
              } else {
                return CreateAccount();
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return CreateAccount();
            }
          }),
    );
  }
}
