// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final int flex;
  final BorderRadius borderRadius;

  AppButton(
      {required this.onPressed,
      required this.text,
      this.flex = 1,
      this.borderRadius = BorderRadius.zero,
      this.textColor = Colors.white,
      this.backgroundColor = Colors.teal});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          minimumSize: Size(0,45), // this minimumSize is used for giving values for width and heights of the buttons
        ),
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontFamily: "Cairo",
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
