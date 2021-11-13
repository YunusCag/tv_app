import 'package:get/get.dart';
import 'package:tv_app/view/main/view/subPages/topRated/controller/top_rated_page_controller.dart';

class TopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TopRatedPageController(
        useCase: Get.find(),
      ),
    );
  }
}
