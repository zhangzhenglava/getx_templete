import 'package:flutter/material.dart';
import 'package:news_getx/common/routes/routes.dart';
import 'package:news_getx/common/store/store.dart';

import 'package:get/get.dart';

/// 第一次欢迎页面
class RouteWelcomeMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (ConfigStore.to.isFirstOpen == false) {
      // 第一次打开
      Future.delayed(
          Duration(seconds: 1),
          () => Get.snackbar("温馨提示", "欢迎使用智慧水务APP,祝工作愉快!",
              snackPosition: SnackPosition.BOTTOM));
    }
    return null;
  }
}
