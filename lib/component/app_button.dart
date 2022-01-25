import 'package:flutter/material.dart';

import 'colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color color;
  final Color bgColor;
  final Color borerColor;
  final double borerRadius;
  const AppButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.bgColor: AppColor.mainColor,
    this.color: Colors.white,
    this.borerColor: Colors.white,
    this.borerRadius: 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borerRadius)),
            side: BorderSide(color: borerColor, width: 1),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: color),
      ),
    );
  }
}
