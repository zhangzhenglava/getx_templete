import 'package:flutter/material.dart';
import 'package:news_getx/common/values/values.dart';
import 'package:news_getx/common/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class SignInPage extends GetView<SignInController> {
  Widget _buildLogo() {
    return Container(
      // margin: EdgeInsets.only(top: 10.h),
      child: Text(
        "登录账号",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
          height: 1,
        ),
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      width: 295.w,
      // height: 204,
      margin: EdgeInsets.only(top: 60.h),
      child: Column(
        children: [
          // email input
          inputTextEdit(
            controller: controller.nameController,
            keyboardType: TextInputType.name,
            hintText: "姓名",
            marginTop: 0,
            // autofocus: true,
          ),
          // password input
          inputTextEdit(
            controller: controller.passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "密码",
            isPassword: true,
            marginTop: 50.h,
          ),

          // 注册、登录 横向布局
          Container(
            height: 44.h,
            margin: EdgeInsets.only(top: 50.h),
            child: Row(
              children: [
                // 注册
                btnFlatButtonWidget(
                  onPressed: controller.handleNavSignUp,
                  gbColor: AppColors.primaryElement,
                  title: "注册",
                ),
                Spacer(),
                // 登录
                btnFlatButtonWidget(
                  onPressed: controller.handleSignIn,
                  gbColor: AppColors.primaryElement,
                  title: "登录",
                ),
              ],
            ),
          ),
          // Spacer(),

          // Fogot password
          // Padding(
          //   padding: EdgeInsets.only(top: 8.0),
          //   child: TextButton(
          //     onPressed: controller.handleFogotPassword,
          //     child: Text(
          //       "Fogot password?",
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //         color: AppColors.secondaryElementText,
          //         fontFamily: "Avenir",
          //         fontWeight: FontWeight.w400,
          //         fontSize: 16.sp,
          //         height: 1, // 设置下行高，否则字体下沉
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildLogo(),
            _buildInputForm(),
          ],
        ),
      ),
    );
  }
}
