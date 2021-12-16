import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class FirstPage extends GetView<FirstController> {
  const FirstPage({Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirstController>(
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
