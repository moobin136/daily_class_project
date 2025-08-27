// import 'package:daily_class_project/contrlller_test.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class SecondPage extends StatelessWidget {
//   final GenderController controller = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Page 2 - Select Gender")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // index দিয়ে loop
//           Obx(() {
//             List<Widget> items = [];
//             for (int i = 0; i < controller.genders.length; i++) {
//               final gender = controller.genders[i];
//               final isSelected = controller.selectedGender.value == gender;
//
//               items.add(
//                 GestureDetector(
//                   onTap: () {
//                     controller.selectedGender.value = gender;
//                   },
//                   child: Container(
//                     margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//                     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                     decoration: BoxDecoration(
//                       color: isSelected ? Colors.blue : Colors.grey[200],
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(
//                         color: isSelected ? Colors.blue : Colors.grey,
//                         width: 2,
//                       ),
//                     ),
//                     child: Center(
//                       child: Text(
//                         gender,
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: isSelected ? Colors.white : Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }
//             return Column(children: items);
//           }),
//
//           SizedBox(height: 40),
//
//           ElevatedButton(
//             onPressed: () {
//               Get.back(); // Page 1 এ ফিরে যাওয়া
//             },
//             child: Text("Update"),
//           ),
//         ],
//       ),
//     );
//   }
// }
