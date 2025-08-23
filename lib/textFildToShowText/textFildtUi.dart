// my_page.dart
import 'package:daily_class_project/textFildToShowText/textFildController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../imageSliderTest/imageSliderUi.dart';


class MyPage extends StatelessWidget {
  // Get.put() দিয়ে কন্ট্রোলারকে ইনিশিয়ালাইজ করা
  final TextController myController = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Save Button Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              // TextField কে কন্ট্রোলারের সাথে যুক্ত করা
              controller: myController.textInputController,
              decoration: InputDecoration(
                labelText: 'কিছু লিখুন',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // বাটনে ক্লিক করলে কন্ট্রোলারের saveText() ফাংশন কল হবে
              onPressed: () => myController.saveText(),
              child: Text('Save'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // বাটনে ক্লিক করলে কন্ট্রোলারের saveText() ফাংশন কল হবে
              onPressed: () => myController.clearText(),
              child: Text('Clear'),
            ),
            SizedBox(height: 20),
            // Obx ব্যবহার করে সেভ করা টেক্সট স্বয়ংক্রিয়ভাবে আপডেট করা
            Obx(() => Text(
                'সেভ করা টেক্সট: ${myController.savedText.value}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
            Get.to(()=> ImageSliderView());
            }, child: Text('NextPage')),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}