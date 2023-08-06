import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var currentIndex = 0.obs;

  int get currentIndexValue => currentIndex.value;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
