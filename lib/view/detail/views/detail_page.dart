import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tv_app/view/detail/controllers/detail_controller.dart';

class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => Text(
            '${controller.seriesDetail.value.name}',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
