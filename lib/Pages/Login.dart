// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use, non_constant_identifier_names, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invoice_gen/Constants/constants.dart';
import 'package:invoice_gen/Pages/Account.dart';
import 'package:invoice_gen/Pages/dashboard.dart';
import 'package:invoice_gen/Pages/homepage.dart';
import 'package:invoice_gen/Widgets/custom_btn.dart';
import 'package:invoice_gen/Widgets/custom_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _Login() async {
    String? _userLoggedIn = await LoginState();
    if (_userLoggedIn != null) {
      _alertDialogBuilder(_userLoggedIn);
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashBoard()));
    }
  }

  // ignore: non_constant_identifier_names
  Future<String?> LoginState() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _Email, password: _Password);
      return null;
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that Email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong Password';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close Dialog Box'),
              ),
            ],
          );
        });
  }

  String _Email = '';
  String _Password = '';

  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 24.0),
                child: Text(
                  'Welcome \nLogin  to your Account',
                  textAlign: TextAlign.center,
                  style: Constants.boldheading,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Input(
                    hinttext: 'Email',
                    onChanged: (value) {
                      _Email = value;
                    },
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                    isPasswordField: false,
                  ),
                  Input(
                    hinttext: 'Password ',
                    onChanged: (value) {
                      _Password = value;
                    },
                    onSubmitted: (value) {},
                    textInputAction: TextInputAction.done,
                    isPasswordField: true,
                  ),
                  GestureDetector(
                    onTap: () {
                      _Login();
                    },
                    child: Button(
                      loadingState: false,
                      text: 'Login',
                      outline: true,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Account()));
                  },
                  child: Button(
                    loadingState: false,
                    text: 'Create a New Account',
                    outline: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
