// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoice_gen/LandingPage.dart';
import 'package:invoice_gen/Pages/Account.dart';
import 'package:invoice_gen/Pages/dashboard.dart';
import 'package:invoice_gen/splash.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/account': (context) => Account(),
      },
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: AnimatedSplashScreen(
          duration: 1750,
          splash: const Center(
            child: Icon(
              Icons.home,
              color: Colors.white,
              size: 200,
            ),
          ),
          nextScreen: LandingPage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
    );
  }
}
/* title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: AnimatedSplashScreen(
            duration: 1750,
            splash: const Center(
              child: Icon(
                Icons.home,
                color: Colors.white,
                size: 200,
              ),
            ),
            nextScreen: const DashBoard(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.black));*/