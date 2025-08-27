// button_group_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'buttonClickConroller.dart';


class ButtonGroupView extends StatelessWidget {
  // Get.put() দিয়ে কন্ট্রোলারকে ইনিশিয়ালাইজ করা
  final ButtonController controller = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Group Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
                () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                controller.buttonNames.length,
                    (index) {
                  // বর্তমান বাটনটি সিলেক্ট করা আছে কিনা তা চেক করা
                  bool isSelected = controller.selectedIndex.value == index;

                  return ElevatedButton(
                    onPressed: () => controller.selectButton(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected ? Colors.blue : Colors.grey,
                      // সিলেক্ট করা বাটনের রঙ নীল এবং বাকিগুলো ধূসর
                    ),
                    child: Text(
                      controller.buttonNames[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}