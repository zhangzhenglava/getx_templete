import 'package:news_getx/pages/first/index.dart';
import 'package:get/get.dart';
import 'package:news_getx/pages/second/index.dart';

import 'controller.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    // Get.lazyPut<MainController>(() => MainController());
    // Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<FirstController>(() => FirstController());
    Get.lazyPut<SecondController>(() => SecondController());
  }
}
