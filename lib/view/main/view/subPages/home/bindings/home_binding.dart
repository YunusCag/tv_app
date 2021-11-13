import 'package:get/get.dart';
import 'package:tv_app/view/main/view/subPages/home/controllers/home_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        useCase: Get.find(),
      ),
    );
  }
}
