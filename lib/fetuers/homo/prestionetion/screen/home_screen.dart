import 'package:daily_class_project/core/utils/consts/app_colors.dart';
import 'package:daily_class_project/core/utils/consts/app_images.dart';
import 'package:daily_class_project/fetuers/homo/prestionetion/screen/wigets/cusotmClipButton.dart';
// Fixed import path
import 'package:daily_class_project/fetuers/homo/prestionetion/screen/wigets/custom_drop_downButton.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left column with buttons
                cardButtonBiuld(),
                const SizedBox(width: 10),
                // Right grid view
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // crossAxisSpacing: 5,
                      // mainAxisSpacing: 3,
                      childAspectRatio: 0.6, // Adjusted for taller cells
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10, 
                    itemBuilder: (context, index) {
                      return const customGridButon();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardButtonBiuld() {
    return Column(
      children: [
        CustomClipButton(
          imagepath:
              ImpaghPath.cardImagePNG, // Fixed typo: ImpaghPath -> ImagePath
          text: 'All',
        ),
        const SizedBox(height: 10),
        CustomClipButton(
          imagepath: ImpaghPath.cardImagePNG,
          text: 'Fore',
        ),
        const SizedBox(height: 10),
        CustomClipButton(
          imagepath: ImpaghPath.cardImagePNG,
          text: 'Apple',
        ),
        const SizedBox(height: 10),
        CustomClipButton(
          imagepath: ImpaghPath.cardImagePNG,
          text: 'Tow',
        ),
        const SizedBox(height: 10),
        CustomClipButton(
          imagepath: ImpaghPath.cardImagePNG,
          text: 'One',
        ),
      ],
    );
  }
}

class customGridButon extends StatelessWidget {
  const customGridButon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Minimize the column's height
        children: [
          Container(
            height: 80, // Reduced height to fit within GridView cell
            width: double.infinity, // Use available width
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(ImpaghPath.cardImagePNG), // Fixed typo
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Apple Text',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Apple New Zealand Queen (18kg)',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '₹1,200',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 30,
            child: CustomDropdownButton(
              borderColor: Colors.transparent,
              hintText: 'Select',
              onChanged: (value) {
                // Handle dropdown value change
              },
              borderRadius: 0,
              backgroundColor: AppColors.dropDonBTColor,
              items: const ['Apple', 'Banana', 'Orange'],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:daily_class_project/core/utils/consts/app_colors.dart';
// import 'package:daily_class_project/core/utils/consts/app_images.dart';
// import 'package:daily_class_project/fetuers/homo/prestionetion/screen/wigets/cusotmClipButton.dart';
// import 'package:daily_class_project/fetuers/homo/prestionetion/screen/wigets/custom_drop_downButton.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
//   String? selectedItem;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Left column with buttons
//                 cardButtonBiuld(),
//                 const SizedBox(width: 5),
//                 // Right grid view
//                 Expanded(
//                   child: GridView.count(
//                     crossAxisCount: 2,
//                     shrinkWrap:
//                         true, // Important: Allows GridView to size itself
//                     physics:
//                         const NeverScrollableScrollPhysics(), // Disable GridView scrolling
//                     children: [
//                       customGridButon(), // Use the custom grid button widget
//                       customGridButon(),
//                       // Add more items as needed
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget cardButtonBiuld() {
//     return Column(
//       children: [
//         CustomClipButton(
//           // Fixed typo: CusotmClipButton -> CustomClipButton
//           imagepath:
//               ImpaghPath.cardImagePNG, // Fixed typo: ImpaghPath -> ImagePath
//           text: 'All',
//         ),
//         const SizedBox(height: 5),
//         CustomClipButton(
//           imagepath: ImpaghPath.cardImagePNG,
//           text: 'Fore',
//         ),
//         const SizedBox(height: 5),
//         CustomClipButton(
//           imagepath: ImpaghPath.cardImagePNG,
//           text: 'Apple',
//         ),
//         const SizedBox(height: 5),
//         CustomClipButton(
//           imagepath: ImpaghPath.cardImagePNG,
//           text: 'Tow',
//         ),
//         const SizedBox(height: 5),
//         CustomClipButton(
//           imagepath: ImpaghPath.cardImagePNG,
//           text: 'One',
//         ),
//       ],
//     );
//   }
// }

// class customGridButon extends StatelessWidget {
//   const customGridButon({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             height: 106,
//             width: 120,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               image: DecorationImage(
//                 image: AssetImage(ImpaghPath.cardImagePNG), // Fixed typo
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             'Apple Text',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(
//             width: 120,
//             child: Text(
//               'Apple New Zealand Queen (18kg)',
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 10,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             '₹1,200',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//           ),
//           const SizedBox(height: 8),
//           SizedBox(
//             width: 120,
//             height: 30,
//             child: CustomDropdownButton(
//               borderColor: Colors.transparent,
//               hintText: 'Select',
//               onChanged: (value) {
//                 // Handle dropdown value change
//               },
//               borderRadius: 0,
//               backgroundColor: AppColors.dropDonBTColor,
//               items: const ['Apple', 'Banana', 'Orange'],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:daily_class_project/core/utils/consts/app_colors.dart';
// import 'package:daily_class_project/core/utils/consts/app_images.dart';
// import 'package:daily_class_project/fetuers/homo/prestionetion/screen/wigets/custom_drop_downButton.dart';
// import 'package:flutter/material.dart';

// import 'wigets/cusotmClipButton.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
//   String? selectedItem;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('data'),
//       ),
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               // Expanded(
//               //   child: GridView.builder(
//               //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               //         crossAxisCount: 2),
//               //     itemBuilder: (context, index) {
//               //       return Container(
//               //         height: 200,
//               //         width: 200,
//               //         color: Colors.amber,
//               //         child: Center(
//               //           child: Text('data'),
//               //         ),
//               //       );
//               //     },
//               //   ),
//               // ),
//               Row(
//                 children: [
//                   cardButtonBiuld(),
//                   SizedBox(width: 5),
//                   Flexible(
//                     child: Expanded(
//                       child: GridView.count(
//                         crossAxisCount: 2,
//                         children: [
//                           Container(
//                             height: 200,
//                             width: 200,
//                             color: Colors.amber,
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }

//   Widget cardButtonBiuld() {
//     return Column(
//       children: [
//         CusotmClipButton(
//           imagepath: ImpaghPath.cardImagePNG,
//           text: 'All',
//         ),
//         SizedBox(height: 5),
//         CusotmClipButton(
//           imagepath: ImpaghPath.cardImagePNG,
//           text: 'Fore',
//         ),
//         SizedBox(height: 5),
//         CusotmClipButton(
//           imagepath: ImpaghPath.cardImagePNG,
//           text: 'Apple',
//         ),
//         SizedBox(height: 5),
//         CusotmClipButton(
//           imagepath: ImpaghPath.cardImagePNG,
//           text: 'Tow',
//         ),
//         SizedBox(height: 5),
//         CusotmClipButton(
//           imagepath: ImpaghPath.cardImagePNG,
//           text: 'One',
//         ),
//       ],
//     );
//   }
// }

// class customGridButon extends StatelessWidget {
//   const customGridButon({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             height: 106,
//             width: 120,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 image: DecorationImage(
//                     image: AssetImage(ImpaghPath.cardImagePNG))),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Apple Text',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//           ),
//           SizedBox(
//             width: 120,
//             child: Text(
//               'Apple New Zealand Queen (18kg)',
//               style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 10,
//                   fontWeight: FontWeight.w400),
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             '₹1,200',
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 8),
//           SizedBox(
//             width: 120,
//             height: 30,
//             child: CustomDropdownButton(
//               borderColor: Colors.transparent,
//               hintText: 'Setlet',
//               // onChanged: (value) {
//               //   selectedItem = value;
//               // },
//               borderRadius: 0,
//               backgroundColor: AppColors.dropDonBTColor,
//               items: const ['Apple', 'Banana', 'Orange'],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
