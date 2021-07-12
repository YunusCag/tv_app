import 'package:get/get.dart';
import 'package:tv_app/view/common/controller/main_controller.dart';
import 'package:tv_app/view/popular/controller/popular_page_controller.dart';
import 'package:tv_app/view/topRated/controller/top_rated_page_controller.dart';

class MainHostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => PopularPageController());
    Get.lazyPut(() => TopRatedPageController());
  }
}
