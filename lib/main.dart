import 'dart:developer';

import 'package:aid_up/Firestore/FirestoreData.dart';
import 'package:aid_up/NGO/Screens/DonationCamp.dart';
import 'package:aid_up/NGO/Screens/NGOHome.dart';
import 'package:aid_up/Services/token.dart';
import 'package:aid_up/Volunteer/Screens/HomeScreen.dart';
import 'package:aid_up/Volunteer/Screens/signup/CreateAccount.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'Volunteer/Screens/signup/login/login.dart';

bool ngo = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String? value = await TokenStorage.getToken();

  if (value != null) {
    log(value);
    if (value == "ngo") {
      ngo = true;
    } else {
      ngo = false;
    }
  }

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
                // await  FirestoreData.userData(context, FirebaseAuth.instance.currentUser!.uid.toString());
                return ngo ? const NGOHomeScreen() : const HomeScreen();
              } else {
                return const CreateAccount();
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const CreateAccount();
            }
          }),
    );
  }
}
