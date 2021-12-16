import 'package:get/get.dart';

import 'controller.dart';

class FirstBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstController>(() => FirstController());
  }
}
