import 'package:acp_app/view/view_utils/themes.dart';
import 'package:flutter/material.dart';

class RoundImageButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundImageButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: Container(
        padding: const EdgeInsets.all(6.0), // Adjust padding for button size
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: Icon(
          icon,
          size: 16.0, // Adjust icon size
          color: CustomThemes().gettheme().black,
        ),
      ),
    );
  }
}
