import 'package:get/get.dart';
import 'package:tv_app/core/data/api/tv_series_service.dart';
import 'package:tv_app/view/common/controller/popular_series_controller.dart';
import 'package:tv_app/view/popular/controller/popular_page_controller.dart';

class PopularBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PopularSeriesController(Get.find<TVSeriesService>()));
    Get.lazyPut(() => PopularPageController());
  }
}
