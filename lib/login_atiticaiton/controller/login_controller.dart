// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import 'dart:convert';
//
// import '../Presentation/screen/welcome_page.dart';
//
// class LoginController extends GetxController {
//
//   var isLoading = false.obs;
//
//   var username = ''.obs;
//   var password = ''.obs;
//
//   Future<void> loginUser() async {
//
//     isLoading(true);
//
//     try {
//       var response = await http.post(
//         Uri.parse('http://10.0.20.33:5003/api/v1/auth/login'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'username': username.value,
//           'password': password.value,
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         return true;
//
//
//         Get.off(() => WelcomePage());
//         Get.snackbar("Succes", "Login Succes", snackPosition: SnackPosition.BOTTOM);
//       } else {
//
//         Get.snackbar("Rong", "Rong Password ", snackPosition: SnackPosition.BOTTOM);
//       }
//     } catch (e) {
//
//       Get.snackbar("${e}", "No login", snackPosition: SnackPosition.BOTTOM);
//     } finally {
//
//       isLoading(false);
//     }
//   }
// }
import 'dart:developer';

import 'package:daily_class_project/login_atiticaiton/Presentation/screen/welcome_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var username = ''.obs;
  var password = ''.obs;



  Future<void> loginUser() async {
    isLoading(true);

    try {
      var response = await http.post(
        Uri.parse('http://10.0.20.33:5003/api/v1/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': username.value,
          'password': password.value,
        }),
      );
      if (response.statusCode == 200) {
          log(response.statusCode.toString());
          Get.to(()=> WelcomePage());
          Get.snackbar("message", "Successfully logged in", snackPosition: SnackPosition.TOP);
      } else {
        print(response.statusCode);
        log(response.statusCode.toString());
        Get.snackbar("Faild", "Login Failde", snackPosition: SnackPosition.TOP);


      }
    } catch (e) {
      Get.snackbar("${e}", " ", snackPosition: SnackPosition.TOP);
    } finally {
      isLoading(false);
    }

  }

}
