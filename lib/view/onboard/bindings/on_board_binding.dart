import 'package:get/get.dart';
import 'package:tv_app/view/onboard/controller/on_board_page_controller.dart';

class OnBoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => OnBoardPageController(),
    );
  }
}
