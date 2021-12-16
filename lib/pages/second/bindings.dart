import 'package:get/get.dart';

import 'controller.dart';

class SecondBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondController>(() => SecondController());
  }
}
