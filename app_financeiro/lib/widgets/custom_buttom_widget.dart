import 'package:flutter/material.dart';

class CustomButtomWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color colorText;
  final VoidCallback onTap;
  const CustomButtomWidget({
    Key? key,
    required this.color,
    required this.text,
    required this.colorText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: colorText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
