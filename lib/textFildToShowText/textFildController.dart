// text_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  // TextField এর জন্য Controller
  final TextEditingController textInputController = TextEditingController();

  // সেভ করা টেক্সট রাখার জন্য রিয়্যাকটিভ ভ্যারিয়েবল
  var savedText = ''.obs;

  // Save বাটনে ক্লিক করলে এই ফাংশনটি কল হবে
  void saveText() {
    // textInputController থেকে টেক্সট নিয়ে savedText ভ্যারিয়েবলে রাখা
    savedText.value = textInputController.text;
  }
  void clearText() {
    textInputController.clear(); // TextField এর টেক্সট খালি করবে
    savedText.value = ''; // সেভ করা টেক্সট ভ্যারিয়েবল খালি করবে
  }

  // যখন Controller আর প্রয়োজন নেই, তখন resources ডিসপোজ করা
  @override
  void onClose() {
    textInputController.dispose();
    super.onClose();
  }
}