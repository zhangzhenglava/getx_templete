import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class SecondPage extends GetView<SecondController> {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SecondController>(
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: HelloWidget(),
          ),
        );
      },
    );
  }
}
