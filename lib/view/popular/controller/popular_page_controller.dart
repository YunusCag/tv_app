import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PopularPageController extends GetxController {
  final ScrollController scrollController = ScrollController();
  var offset = 0.0.obs;

  @override
  void onInit() {
    scrollController.addListener(() {
      offset.value = scrollController.offset;
    });
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
