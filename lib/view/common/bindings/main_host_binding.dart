import 'package:get/get.dart';
import 'package:tv_app/view/common/controller/main_controller.dart';

class MainHostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());

  }
}
