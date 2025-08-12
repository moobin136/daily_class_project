import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.snackbar('Titile', 'Massage',
        snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black12
        );
      }),
      appBar: AppBar(title: Text('Get X')),
      body: Column(children: []),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
//
// import 'counterController.dart';
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   CounterControlle counterControlle = CounterControlle();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           counterControlle.increment();
//         },
//         child: Icon(Icons.add),
//       ),
//       appBar: AppBar(title: Text('AppBar')),
//       body: Center(
//         child: GetBuilder<CounterControlle>(
//           builder: (CounterControlle) {
//             return Text(
//               '${counterControlle.counter}',
//               style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
