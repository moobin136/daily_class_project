import 'package:daily_class_project/fevarit/fav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class FavUi extends StatelessWidget {
  FavUi({super.key});
  final FavController favController = Get.put(FavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Chaker')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favController.dataList.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => Card(
                    color:
                        favController.emtyList.contains(
                          favController.dataList[index],
                        )
                        ? Colors.blue
                        : const Color.fromARGB(255, 197, 139, 139),
                    child: ListTile(
                      onTap: () {
                        if (favController.emtyList.contains(
                          favController.dataList[index].toString(),
                        )) {
                          favController.emtyList.remove(
                            favController.dataList[index].toString(),
                          );
                        } else {
                          favController.emtyList.add(
                            favController.dataList[index].toString(),
                          );
                        }
                      },
                      title: Obx(
                        () => Text(
                          favController.dataList[index].toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color:
                                favController.emtyList.contains(
                                  favController.dataList[index],
                                )
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      trailing: Obx(
                        () => Icon(
                          Icons.ramp_left_outlined,
                          color:
                              favController.emtyList.contains(
                                favController.dataList[index].toString(),
                              )
                              ? Colors.red
                              : Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
