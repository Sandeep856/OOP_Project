// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:invoice_gen/Pages/Login.dart';
import 'package:invoice_gen/Pages/dashboard.dart';
import 'package:invoice_gen/Pages/homepage.dart';

import 'Constants/constants.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Error:${snapshot.error}'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, streamSnapshot) {
                  if (streamSnapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text('Error:${streamSnapshot.error}'),
                      ),
                    );
                  }
                  if (streamSnapshot.connectionState ==
                      ConnectionState.active) {
                    Object? _user = streamSnapshot.data;
                    if (_user == null) {
                      return LoginPage();
                    } else {
                      return DashBoard();
                    }
                  }
                  return Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SafeArea(
                            child: Text(
                              'Checking Authentication..',
                              style: Constants.regularHeadings,
                            ),
                          ),
                          SpinKitRotatingCircle(
                            color: Colors.blue,
                            size: 50.0,
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
          return Scaffold(
            body: Column(
              children: [
                Text(
                  'Initializing App....',
                  style: Constants.regularHeadings,
                ),
                SpinKitRotatingCircle(
                  color: Colors.blue,
                  size: 50.0,
                )
              ],
            ),
          );
        });
  }
}
