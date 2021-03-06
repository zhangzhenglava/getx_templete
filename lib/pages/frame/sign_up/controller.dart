import 'package:flutter/material.dart';
import 'package:news_getx/common/apis/apis.dart';
import 'package:news_getx/common/entities/entities.dart';
import 'package:news_getx/common/utils/utils.dart';
import 'package:news_getx/common/widgets/widgets.dart';
import 'package:get/get.dart';

import 'index.dart';

class SignUpController extends GetxController {
  SignUpController();

  /// obs 响应式变量 才写入 state
  final state = SignUpState();

  /// 业务变量

  final TextEditingController positionController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  /// 业务事件

  // 返回上一页
  handleNavPop() {
    Get.back();
  }

  // 提示信息
  handleTip() {
    toastInfo(msg: '这是注册界面');
  }

  // 忘记密码
  handleFogotPassword() {
    toastInfo(msg: '忘记密码');
  }

  // 执行注册操作
  handleSignUp() async {
    // if (!duCheckStringLength(positionController.value.text, 5)) {
    //   toastInfo(msg: '用户名不能小于5位');
    //   return;
    // }
    // if (!duIsEmail(nameController.value.text)) {
    //   toastInfo(msg: '请正确输入邮件');
    //   return;
    // }
    // if (!duCheckStringLength(passController.value.text, 6)) {
    //   toastInfo(msg: '密码不能小于6位');
    //   return;
    // }

    UserRegisterRequestEntity params = UserRegisterRequestEntity(
      email: nameController.value.text,
      password: duSHA256(passController.value.text),
    );

    await UserAPI.register(
      params: params,
    );
    // 注册成功 到登录页面
    Get.back();
  }

  /// 生命周期

  // 页面载入完成
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    positionController.dispose();
    nameController.dispose();
    passController.dispose();
    super.dispose();
  }
}
