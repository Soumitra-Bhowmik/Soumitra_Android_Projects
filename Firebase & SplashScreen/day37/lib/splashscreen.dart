import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:day37/login.dart';
import 'package:day37/view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScr extends StatefulWidget {
  const SplashScr({ Key? key }) : super(key: key);

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Icons.home,
            nextScreen: ViewData(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.scale,
            )
            
            );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 50,
    height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage("https://images.squarespace-cdn.com/content/v1/564cb412e4b00715f8659ed7/1462482944629-R1L8K8SMKGT9F4CO2N0L/image-asset.gif")
      ),
    )
    );
  }
}