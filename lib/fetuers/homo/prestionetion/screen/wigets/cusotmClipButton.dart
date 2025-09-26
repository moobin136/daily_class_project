import 'package:flutter/material.dart';

class CustomClipButton extends StatelessWidget {
  const CustomClipButton({
    super.key,
    required this.text,
    required this.imagepath,
  });

  final String text;
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, // Set a fixed width to constrain the button
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 207, 207, 207),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Minimize the column's height
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28, // Adjusted size for better appearance
            backgroundImage: AssetImage(imagepath),
          ),
          const SizedBox(height: 8), // Add spacing between image and text
          FittedBox(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}