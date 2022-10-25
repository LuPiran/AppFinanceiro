import 'package:flutter/material.dart';

class CustomTextButtomWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onTap;
  const CustomTextButtomWidget({
    Key? key,
    required this.onTap,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
