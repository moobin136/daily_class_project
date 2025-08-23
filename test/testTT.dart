// class ImageSliderView extends StatelessWidget {
//   final ImageController controller = Get.put(ImageController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GetX Image Slider'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 300,
//               child: PageView.builder(
//                 itemCount: controller.images.length,
//                 onPageChanged: (index) => controller.updateIndex(index),
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Image.asset(
//                       controller.images[index],
//                       fit: BoxFit.cover,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             // ইন্ডিকেটর বার যুক্ত করা
//             Obx(
//                   () => Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(
//                   controller.images.length,
//                       (index) => Container(
//                     width: 8.0,
//                     height: 8.0,
//                     margin: EdgeInsets.symmetric(horizontal: 4.0),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: controller.currentPageIndex.value == index
//                           ? Colors.white // সক্রিয় ইন্ডিকেটর এর রঙ সাদা
//                           : Colors.grey, // বাকি ইন্ডিকেটর এর রঙ ধূসর
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }