// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  late final String text;
  late final bool loadingState;
  late final bool outline;

  Button({
    required this.text,
    required this.loadingState,
    required this.outline,
  });

  static get widget => null;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        height: 70.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.lightBlue[100],
        ),
        child: Stack(
          children: [
            Visibility(
              visible: loadingState == true ? false : true,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: loadingState == true ? true : false,
              child: Center(
                child: SizedBox(
                  height: 30.0,
                  width: 30.0,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 24.0,
        ),
      ),
    );
  }
}
