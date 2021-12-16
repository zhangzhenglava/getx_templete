import 'package:flutter/material.dart';
import 'package:news_getx/common/middlewares/middlewares.dart';
import 'package:news_getx/common/middlewares/router_signin.dart';
import 'package:news_getx/pages/application/index.dart';
import 'package:news_getx/pages/category/index.dart';
import 'package:news_getx/pages/frame/sign_in/index.dart';
import 'package:news_getx/pages/frame/sign_up/index.dart';
import 'package:news_getx/pages/frame/welcome/index.dart';
import 'package:get/get.dart';
import 'package:news_getx/pages/second/bindings.dart';
import 'package:news_getx/pages/second/index.dart';

import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    // 欢迎页
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      // 判断是否第一次打开
      middlewares: [
        RouteWelcomeMiddleware(priority: 0),
      ],
    ),
    // 登录页
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => SignInPage(),
      binding: SignInBinding(),
      middlewares: [
        RouteSigninMiddleware(priority: 0),
      ],
    ),
    // 注册页
    GetPage(
      name: AppRoutes.SIGN_UP,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),

    // 需要登录
    GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationPage(),
      binding: ApplicationBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),
  ];

  // static final unknownRoute = GetPage(
  //   name: AppRoutes.NotFound,
  //   page: () => NotfoundView(),
  // );

}
