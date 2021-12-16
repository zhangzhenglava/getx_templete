import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:news_getx/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

/* 欢迎页 使用 getview 可直接获取controller  */
class WelcomePage extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTextPart(),
            SizedBox(
              height: 100,
            ),
            Spacer(),
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.none,
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextPart() {
    return Container(
      margin: EdgeInsets.only(top: 300), // 顶部系统栏 44px
      child: _buildTextTyper(),
    );
  }

  Widget _buildTextTyper() {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 30.0,
          fontFamily: 'popin',
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            RotateAnimatedText(controller.state.groupName),
            TyperAnimatedText(
              controller.state.slogn,
              textAlign: TextAlign.center,
              speed: const Duration(milliseconds: 80),
            ),
          ],
          onFinished: controller.handleNavSignIn,
          isRepeatingAnimation: true,
          totalRepeatCount: 1,
        ),
      ),
    );
  }
}
