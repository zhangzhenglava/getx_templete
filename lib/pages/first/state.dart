import 'package:get/get.dart';

class FirstState {
  // title
  final _title = "gfsadgasd".obs;
  set title(value) => _title.value = value;
  get title => _title.value;
}
