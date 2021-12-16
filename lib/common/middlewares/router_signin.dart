import 'package:flutter/material.dart';
import 'package:news_getx/common/routes/routes.dart';
import 'package:news_getx/common/store/store.dart';

import 'package:get/get.dart';

/// 第一次欢迎页面
class RouteSigninMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteSigninMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
  
    if (UserStore.to.isLogin) {
      return RouteSettings(name: AppRoutes.Application);
    }
    return null;
  }
}
