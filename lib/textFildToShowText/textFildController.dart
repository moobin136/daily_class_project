// text_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextController extends GetxController {

  final TextEditingController textInputController = TextEditingController();

 
  var savedText = ''.obs;


  void saveText() {
   
    savedText.value = textInputController.text;
  }
  void clearText() {
    textInputController.clear(); 
    savedText.value = ''; 
  }

  
  @override
  void onClose() {
    textInputController.dispose();
    super.onClose();
  }
}