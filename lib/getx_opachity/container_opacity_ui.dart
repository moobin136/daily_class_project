import 'package:daily_class_project/getx_opachity/container_opacity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerOpacityUi extends StatelessWidget {
  ContainerOpacityUi({super.key});

  ContainerOpacity containerOpacity = Get.put(ContainerOpacity());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Opacity')),
      body: Column(
        children: [
          Obx(
            () => Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  containerOpacity.cerculer.value,
                ),
                color: Colors.amber.withOpacity(containerOpacity.opacity.value),
              ),
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => Text(
              containerOpacity.opacity.value.toString(),
              style: TextStyle(fontSize: 14),
            ),
          ),
          Obx(
            () => Slider(
              max: 1,
              min: 0.0,
              label: containerOpacity.opacity.value.toString(),

              value: containerOpacity.opacity.value,
              onChanged: (value) {
                containerOpacity.opacityFun(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
