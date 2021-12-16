import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// hello
class HelloWidget extends StatefulWidget {
  HelloWidget({Key? key}) : super(key: key);

  @override
  _HelloWidgetState createState() => _HelloWidgetState();
}

class _HelloWidgetState extends State<HelloWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final controller = Get.find<FirstController>();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Text(controller.state.title),
    );
  }
}
