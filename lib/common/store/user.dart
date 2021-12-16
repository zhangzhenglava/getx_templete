import 'dart:convert';

import 'package:news_getx/common/apis/apis.dart';
import 'package:news_getx/common/entities/entities.dart';
import 'package:news_getx/common/services/services.dart';
import 'package:news_getx/common/values/values.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 是否登录
  final _isLogin = false.obs;
  // 令牌 token 未用
  String token = '';
  // 用户 profile
  final _profile = UserLoginResponseEntity().obs;

  bool get isLogin => _isLogin.value;
  UserLoginResponseEntity get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    // 获取用户信息
    var profile = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    // 是否登录
    _isLogin.value = StorageService.to.getBool(STORAGE_USER_ISLOGIN_KEY);
    if (profile.isNotEmpty) {
      _profile(UserLoginResponseEntity.fromJson(jsonDecode(profile)));
    }
  }

  // 保存 token
  Future<void> setToken(String value) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
    token = value;
  }

  // 获取 profile
  Future<void> getProfile() async {
    if (token.isEmpty) return;
    var result = await UserAPI.profile();
    _profile(result);
    _isLogin.value = true;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(result));
  }

  // 保存 用户信息profile
  Future<void> saveProfile(UserLoginResponseEntity profile) async {
    // 设置已登陆
    _isLogin.value = true;
    StorageService.to.setBool(STORAGE_USER_ISLOGIN_KEY, true);
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(profile));
  }

  // 注销
  Future<void> onLogout() async {
    if (_isLogin.value) await UserAPI.logout();
    await StorageService.to.remove(STORAGE_USER_TOKEN_KEY);
    _isLogin.value = false;
    token = '';
  }
}