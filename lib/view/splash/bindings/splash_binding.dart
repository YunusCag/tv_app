import 'package:get/get.dart';
import 'package:tv_app/view/splash/controller/splash_page_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashPageController());
  }
}
