import 'package:get/get.dart';
import 'package:tv_app/view/detail/controllers/detail_controller.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController(Get.find()));
  }
}
