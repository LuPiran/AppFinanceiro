
import 'package:app_financeiro/utils/colors.dart';
import 'package:flutter/material.dart';

class BarItemWidget extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  const BarItemWidget({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Icon(
                icon,
                size: 24,
                color: isSelected ? limeColor : Colors.grey,
              ),
            ),
          ),
        ),
    );
  }
}