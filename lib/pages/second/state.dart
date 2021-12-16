import 'package:get/get.dart';

class SecondState {
  // title
  final _title = "kkkkkkkkkkk".obs;
  set title(value) => _title.value = value;
  get title => _title.value;
}
