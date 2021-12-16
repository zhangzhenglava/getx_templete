import 'package:flutter/material.dart';
import 'package:news_getx/common/apis/apis.dart';
import 'package:news_getx/common/entities/entities.dart';
import 'package:news_getx/common/routes/routes.dart';
import 'package:news_getx/common/store/store.dart';
import 'package:news_getx/common/utils/utils.dart';
import 'package:news_getx/common/widgets/widgets.dart';
import 'package:get/get.dart';

import 'index.dart';

class SignInController extends GetxController {
  final state = SignInState();

  SignInController();

  // email的控制器
  final TextEditingController nameController = TextEditingController();
  // 密码的控制器
  final TextEditingController passController = TextEditingController();

  // final MyRepository repository;
  // SignInController({@required this.repository}) : assert(repository != null);

  // 跳转 注册界面
  handleNavSignUp() {
    Get.toNamed(AppRoutes.SIGN_UP);
  }

  // 忘记密码
  handleFogotPassword() {
    toastInfo(msg: '忘记密码');
  }

  // 执行登录操作
  handleSignIn() async {
    if (!duCheckStringLength(passController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }

    UserLoginRequestEntity params = UserLoginRequestEntity(
      email: nameController.value.text,
      password: duSHA256(passController.value.text),
    );

    UserLoginResponseEntity userProfile = await UserAPI.login(
      params: params,
    );
    // 登录成功保存用户信息和设置已登录
    UserStore.to.saveProfile(userProfile);
    // 登录成功转到主页
    Get.offAndToNamed(AppRoutes.Application);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    super.dispose();
  }
}
