import 'package:flutter/material.dart';
import 'package:acp_app/view/view_utils/themes.dart';

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

Widget roundedTextContainer() {
  return Container(
    padding: const EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      color: CustomThemes().gettheme().whitecolor, // Background color
      borderRadius: BorderRadius.circular(14.0), // Rounded corners
      border: Border.all(
        color: CustomThemes().gettheme().bgColor, // Border color
        width: 1.0, // Border width
      ),
    ),
    child: Text(
      'Free',
      style: TextStyle(
        color: CustomThemes().gettheme().bgColor, // Text color
        fontSize: 9.0,
        fontWeight: FontWeight.bold,
        fontFamily: CustomThemes().gettheme().font1,
        // Text sizeC
      ),
    ),
  );
}
