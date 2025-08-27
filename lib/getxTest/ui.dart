// import 'package:daily_class_project/contrlller_test.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class GenderScreen extends StatelessWidget {
//   final GenderController controller = Get.put(GenderController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Gender Selection Example")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [

//             // Step 1: প্রথমে বাটন চাপলে face আসবে
//             ElevatedButton(
//               onPressed: () {
//                 controller.showFace.value = !controller.showFace.value;
//               },
//               child: Text("Show/Hide Face"),
//             ),

//             SizedBox(height: 20),

//             // Step 2: Face show করা হবে যদি button চাপা হয়
//             Obx(() =>
//               controller.showFace.value
//                   ? Icon(Icons.face, size: 100, color: Colors.blue)
//                   : SizedBox.shrink(),
//             ),

//             SizedBox(height: 20),

//             // Step 3: Gender Selection Buttons
//             Obx(() => Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ChoiceChip(
//                       label: Text("Everyone"),
//                       selected: controller.selectedGender.value == "Everyone",
//                       onSelected: (_) {
//                         controller.selectedGender.value = "Everyone";
//                       },
//                     ),
//                     SizedBox(width: 10),
//                     ChoiceChip(
//                       label: Text("Man"),
//                       selected: controller.selectedGender.value == "Man",
//                       onSelected: (_) {
//                         controller.selectedGender.value = "Man";
//                       },
//                     ),
//                     SizedBox(width: 10),
//                     ChoiceChip(
//                       label: Text("Woman"),
//                       selected: controller.selectedGender.value == "Woman",
//                       onSelected: (_) {
//                         controller.selectedGender.value = "Woman";
//                       },
//                     ),
//                   ],
//                 )
//               ],
//             )),

//             SizedBox(height: 30),

//             // Step 4: Update Button চাপলে result দেখাবে
//             ElevatedButton(
//               onPressed: () {
//                 Get.snackbar(
//                   "Update",
//                   "You selected: ${controller.selectedGender.value}",
//                   snackPosition: SnackPosition.BOTTOM,
//                 );
//               },
//               child: Text("Update"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
