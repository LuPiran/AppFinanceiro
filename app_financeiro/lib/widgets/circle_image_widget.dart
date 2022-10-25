import 'package:flutter/material.dart';

class CircleImageWidget extends StatelessWidget {
  final String image;
  const CircleImageWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
      ),
      child: Center(
        child: Container(
          child: Image.asset(
            image,
            scale: 2,
          ),
        ),
      ),
    );
  }
}