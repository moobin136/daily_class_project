import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhtoAndGelrayController extends GetxController {
  RxString image = ''.obs;
  final ImagePicker _iamgePicker = ImagePicker();
  Future getCamera() async {
    final image = await _iamgePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      this.image.value = image.path.toString();
    }
  }

  Future getGelary() async {
    final image = await _iamgePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      this.image.value = image.path.toString();
    }
  }
}
