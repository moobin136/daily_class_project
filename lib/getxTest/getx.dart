import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetxTest')),

      body: Column(
        children: [
          // TextButton(
          //   onPressed: () {
          //     Get.snackbar(
          //       'title',
          //       'message',
          //       animationDuration: Duration(milliseconds: 2),
          //       backgroundColor: Colors.amber,
          //       isDismissible: true,
          //     );
          //   },
          //   child: Text('tap'),
          // ),
          Card(
            child: ListTile(
              title: Text('Tiitle text'),
              subtitle: Text('Subtitile'),
              onTap: () {
                Get.defaultDialog(
                  titlePadding: EdgeInsets.only(top: 30),
                  title: 'One',
                  content: Text(''),
                );
              },
            ),
          ),

          Card(
            child: ListTile(
              title: Text('Tiitle text'),
              subtitle: Text('Subtitile'),
              onTap: () {
                Get.bottomSheet(
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.changeTheme(ThemeData.light());
                          },
                          child: Text('Light'),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Get.changeTheme(ThemeData.dark());
                          },
                          child: Text('Dart'),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 16),
          //TODO
          // Card(child: Container()),
        ],
      ),
    );
  }
}
