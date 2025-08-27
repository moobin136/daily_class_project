import 'package:get/get.dart';

class ContainerOpacity extends GetxController {
  var opacity = 1.0.obs;
  RxDouble cerculer = 1.0.obs;

  void opacityFun(nexValu) {
    opacity.value = nexValu;
  }
  void cercel(nexValu) {
    cerculer.value = nexValu;
  }
}
