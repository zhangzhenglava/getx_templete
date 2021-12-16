import 'package:news_getx/common/routes/routes.dart';
import 'package:news_getx/common/store/store.dart';
import 'package:get/get.dart';

import 'index.dart';

/* 欢迎页控制器 */
class WelcomeController extends GetxController {
  final state = WelcomeState();

  WelcomeController();

  // 跳转 登录界面
  handleNavSignIn() async {
    await ConfigStore.to.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }

  @override
  void onReady() {
    super.onReady();
  }
}
