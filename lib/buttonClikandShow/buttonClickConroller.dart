import 'package:get/get.dart';

class ButtonController extends GetxController {
  final List<String> buttonNames = ['one', 'two', 'three', 'four', 'five'];

  
  final RxInt selectedIndex = (-1).obs;

  void selectButton(int index) {
    selectedIndex.value = index;
  }
}
