// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ImageSliderController extends GetxController {
//   var sliderValue = 1.0.obs; // initial scale
// }
//
// class ImageSliderPage extends StatelessWidget {
//   final ImageSliderController controller = Get.put(ImageSliderController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Slider Image Resize")),
//       body: Column(
//         children: [
//           Obx(() {
//             return Container(
//               alignment: Alignment.topCenter,
//               margin: EdgeInsets.symmetric(vertical: 20),
//               child: Image.asset(
//                 "assets/your_image.png", // replace with your image
//                 width: 200 * controller.sliderValue.value,
//                 height: 200 * controller.sliderValue.value,
//               ),
//             );
//           }),
//           Obx(() {
//             return Slider(
//               value: controller.sliderValue.value,
//               min: 0.5, // minimum scale
//               max: 1.5, // maximum scale
//               onChanged: (value) {
//                 controller.sliderValue.value = value;
//               },
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }
