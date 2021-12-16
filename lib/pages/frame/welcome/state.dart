import 'package:get/get.dart';

/* 欢迎页状态管理 */
class WelcomeState {
  final _groupName = '瑞源集团'.obs;
  final _slogn = '永 远 向 上'.obs;
  set groupName(value) => this._groupName.value = value;
  get groupName => this._groupName.value;
  set slogn(value) => this._slogn.value = value;
  get slogn => this._slogn.value;

  // WelcomeState() {}
}
