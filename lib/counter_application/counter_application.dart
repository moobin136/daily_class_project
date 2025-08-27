import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart' show CounterController;

class CounterApplication extends StatelessWidget {
  CounterApplication({super.key});

  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.resultCount();
        },
      ),
      appBar: AppBar(title: Text('Counter Application')),
      body: Center(
        child: Obx(
          () => Text('Counter Result : ${counterController.counter.value}'),
        ),
      ),
    );
  }
}
