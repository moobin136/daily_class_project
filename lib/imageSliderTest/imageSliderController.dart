// image_controller.dart
import 'package:get/get.dart';

class ImageController extends GetxController {
  // আপনার ইমেজগুলোর তালিকা
  final List<String> images = [
    ///first iamge
    'https://img.freepik.com/free-photo/beautiful-view-sunset-sea_23-2148019892.jpg?t=st=1755921165~exp=1755924765~hmac=5bdd16e1fa00e3308f5f9c7e00515d86bcd0db217df42915c6ed40a573c74fd5&w=1480',

    ///2nd image
    'https://img.freepik.com/free-photo/woman-beach-with-her-baby-enjoying-sunset_52683-144131.jpg?t=st=1755922455~exp=1755926055~hmac=07051a9451ab3c841e8930fd7b0baa482b9264252026c12af5862cbb0cf4e215&w=1060',

    ///3rd image
    'https://cdn.pixabay.com/photo/2017/06/06/14/35/people-2377404_960_720.jpg',

    //4th image
    'https://cdn.pixabay.com/photo/2018/08/04/11/30/draw-3583548_1280.png',
  ];

  // বর্তমান পেইজ ইনডেক্স ট্র্যাক করার জন্য রিয়্যাকটিভ ভ্যারিয়েবল
  var currentPageIndex = 0.obs;

  // যখন পেইজ পরিবর্তন হয়, এই ফাংশনটি কল হবে
  void updateIndex(int index) {
    currentPageIndex.value = index;
  }
}
