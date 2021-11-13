import 'package:get/get.dart';
import 'package:tv_app/view/main/view/subPages/popular/controller/popular_page_controller.dart';

class PopularBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PopularPageController(
        useCase: Get.find(),
      )
    );
  }
}
