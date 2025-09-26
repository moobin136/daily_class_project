import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final List<String> items; // List of items to display
  final int crossAxisCount; // Number of columns
  final double mainAxisSpacing; // Spacing between rows
  final double crossAxisSpacing; // Spacing between columns
  final double childAspectRatio; // Aspect ratio of grid items
  final Color cardColor; // Background color of grid items
  final Color textColor; // Text color of grid items
  final double borderRadius; // Border radius for grid items
  final Function(String)? onItemTap; // Callback for item tap

  const CustomGridView({
    Key? key,
    required this.items,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 8.0,
    this.crossAxisSpacing = 8.0,
    this.childAspectRatio = 1.0,
    this.cardColor = Colors.white,
    this.textColor = Colors.black,
    this.borderRadius = 12.0,
    this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: onItemTap != null ? () => onItemTap!(item) : null,
          child: Card(
            color: cardColor,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Center(
              child: Text(
                item,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}