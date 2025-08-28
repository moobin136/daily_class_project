import 'package:get/get.dart';

class FavController extends GetxController {
  RxList dataList = ['One', 'Tow', 'Three', 'Fore'].obs;
  RxList emtyList = [].obs;



  addItmes(String valu) {
    emtyList.add(valu);
  }
   removeItmes(String valu) {
    emtyList.remove(valu);
  }
}
