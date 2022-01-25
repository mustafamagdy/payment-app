import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;
  String? label;
  AppIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.color = Colors.white,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: color, width: 3)),
                width: 45,
                height: 45,
                child: Icon(
                  icon,
                  color: color,
                  size: 30,
                ),
              ),
              if (label != null) SizedBox(height: 5),
              if (label != null)
                FittedBox(
                  child: Text(
                    label!,
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                )
            ],
          ),
        ));
  }
}
