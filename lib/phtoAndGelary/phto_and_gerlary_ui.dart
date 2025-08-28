import 'dart:io';

import 'package:daily_class_project/phtoAndGelary/phto_and_gelray_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhtoAndGerlaryUi extends StatelessWidget {
  PhtoAndGerlaryUi({super.key});
  final PhtoAndGelrayController phtoAndGelrayController = Get.put(
    PhtoAndGelrayController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera And Photo')),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => CircleAvatar(
                radius: 50,
                backgroundImage: phtoAndGelrayController.image.isNotEmpty
                    ? FileImage(
                        File(phtoAndGelrayController.image.value.toString()),
                      )
                    : null,
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                phtoAndGelrayController.getCamera();
              },
              child: Text('Camera'),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                phtoAndGelrayController.getGelary();
              },
              child: Text('Gelary'),
            ),
          ],
        ),
      ),
    );
  }
}
