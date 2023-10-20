import 'package:adminease/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  CustomOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 11,
            backgroundColor: isSelected ? AppColors.navyBlue : Colors.grey[400],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label),
        )
      ],
    );
  }
}
