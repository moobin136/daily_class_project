import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> items; // List of dropdown items
  final String? selectedItem; // Currently selected item
  final ValueChanged<String?>? onChanged; // Callback for selection changes
  final String hintText; // Hint text when no item is selected
  final Color borderColor; // Border color
  final Color backgroundColor; // Background color
  final Color textColor; // Text color
  final double borderRadius; // Border radius for rounded corners
  final double width; // Width of the dropdown

  const CustomDropdownButton({
    Key? key,
    required this.items,
    this.selectedItem,
    this.onChanged,
    this.hintText = 'Select an item',
    this.borderColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.borderRadius = 12.0,
    this.width = 200.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        isExpanded: true, // Takes full width of container
        underline: const SizedBox.shrink(), // Removes default underline
        borderRadius: BorderRadius.circular(borderRadius),
        icon: Icon(Icons.arrow_drop_down, color: borderColor),
        hint: Text(hintText, style: TextStyle(color: textColor)),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}