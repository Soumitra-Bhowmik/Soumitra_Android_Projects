import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/Pages/homepage.dart';
import 'package:travel_app/Pages/signup.dart';
import 'package:travel_app/Pages/viewpage.dart';
import 'package:travel_app/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your applicati
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Molay App',
      //home: HomePage(),
      home: SplashScreen(),
      //home: SignUp(),
    );
  }
}
