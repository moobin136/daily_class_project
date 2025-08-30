
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/login_controller.dart';


class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            TextField(
              decoration: const InputDecoration(
                labelText: 'UserName',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                loginController.username.value = value;
              },
            ),
            const SizedBox(height: 16),

            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                loginController.password.value = value;
              },
            ),
            const SizedBox(height: 32),

            Obx(() => ElevatedButton(
              onPressed: loginController.isLoading.value
                  ? null
                  : () => loginController.loginUser(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: loginController.isLoading.value
                  ? const CircularProgressIndicator(color: Colors.black)
                  : const Text('Login'),
            )),
          ],
        ),
      ),
    );
  }
}



// import 'package:daily_class_project/login_atiticaiton/Presentation/screen/welcome_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class Login extends StatelessWidget {
//   const Login({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login Screen')),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             TextFormField(),
//             SizedBox(height: 20),
//             TextFormField(),
//             SizedBox(height: 30),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(onPressed: () {
//                 Get.to(()=> WelcomePage());
//               }, child: Text('Login')),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
