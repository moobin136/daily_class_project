// // home_page.dart
// import 'package:daily_class_project/contrlller_test.dart';
// import 'package:daily_class_project/page_2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class HomePage extends StatelessWidget {
//   final GenderController controller = Get.put(GenderController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Page 1 - Home")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Show selected gender
//             Obx(
//               () => Text(
//                 "You selected: ${controller.selectedGender.value}",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//             ),
//
//             SizedBox(height: 40),
//
//             ElevatedButton(
//               onPressed: () {
//                 Get.to(() => SecondPage());
//               },
//               child: Text("Go to Gender Page"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
