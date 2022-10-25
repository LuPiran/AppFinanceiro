import 'package:flutter/material.dart';

class AppbarCadastroLoginWidget extends StatelessWidget
    with PreferredSizeWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const AppbarCadastroLoginWidget(
      {Key? key, required this.icon, required this.onPressed})
      : preferredSize = const Size.fromHeight(80),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: onPressed,
              child: Icon(
                icon,
                color: Colors.grey[400]!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
