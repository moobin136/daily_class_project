// my_page.dart

import 'package:daily_class_project/customBlur/blur.dart';
import 'package:daily_class_project/customTest.dart';
import 'package:daily_class_project/custom_conteiner/custom_conteiner.dart';
import 'package:daily_class_project/fevarit/fav_ui.dart';
import 'package:daily_class_project/getx_opachity/container_opacity_ui.dart';
import 'package:daily_class_project/phtoAndGelary/phto_and_gerlary_ui.dart';
import 'package:daily_class_project/textFildToShowText/textFildController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../api_test/presentatrion/screen/product_screen.dart';
import '../buttonClikandShow/buttonClickUi.dart';
import '../counter_application/counter_application.dart';
import '../cusotmButton/customButtonUi.dart';
import '../imageSliderTest/imageSliderUi.dart';

class MyPage extends StatelessWidget {
  // Get.put() দিয়ে কন্ট্রোলারকে ইনিশিয়ালাইজ করা
  final TextController myController = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Save Button Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              Obx(
                () => Text(
                  'সেভ করা টেক্সট: ${myController.savedText.value}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => ImageSliderView());
                },
                child: Text('ImageSlider'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //TODO
                  Get.to(() => ButtonGroupView());
                },
                child: Text('ButtonWork'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //TODO
                  Get.to(() => Custombuttonui());
                },
                child: Text('CustomButton'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //TODO
                  Get.to(() => Blur());
                },
                child: Text('Blur'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //TODO
                  Get.to(() => PlaceCard());
                },
                child: Text('Custom_Container'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //TODO
                  Get.to(() => ContactUsPage());
                },
                child: Text('CustomTest'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //TODO
                  Get.to(() => CounterApplication());
                },
                child: Text('Counter Application'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //TODO
                  Get.to(() => ContainerOpacityUi());
                },
                child: Text('ContainerOpacity'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //TODO
                  Get.to(() => FavUi());
                },
                child: Text('FavAddRemove'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //TODO
                  Get.to(() => PhtoAndGerlaryUi());
                },
                child: Text('CameraAndGelaryPath'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //TODO
                  Get.to(() => ProductScreen());
                },
                child: Text('API Test'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
