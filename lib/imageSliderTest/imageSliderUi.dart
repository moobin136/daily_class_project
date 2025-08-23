// image_slider_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'imageSliderController.dart';

class ImageSliderView extends StatelessWidget {
  // Get.put() ব্যবহার করে কন্ট্রোলার ইনিশিয়ালাইজ করা
  final ImageController controller = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Image Slider')),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300, // স্লাইডারের উচ্চতা
              child: PageView.builder(
                itemCount: controller.images.length,
                // যখন পেইজ পরিবর্তন হয়, তখন কন্ট্রোলারের ফাংশন কল করা
                onPageChanged: (index) => controller.updateIndex(index),
                itemBuilder: (context, index) {
                  return Image.network(
                    controller.images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Obx ব্যবহার করে বর্তমান পেইজ নম্বর দেখানো
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.images.length,
                  (index) => Container(
                    width: 40.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(left:Radius.circular(10),right: Radius.circular(10)),
                      shape: BoxShape.rectangle,
                      color: controller.currentPageIndex.value == index
                          ? Colors
                                .blue // সক্রিয় ইন্ডিকেটর এর রঙ সাদা
                          : Colors.grey, // বাকি ইন্ডিকেটর এর রঙ ধূসর
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              
            }, child: Text('NextPage'))
          ],
        ),
      ),
    );
  }
}
