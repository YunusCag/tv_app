import 'package:get/get.dart';
import 'package:tv_app/core/data/api/tv_series_client.dart';
import 'package:tv_app/view/common/controller/top_rated_series_controller.dart';
import 'package:tv_app/view/main/view/subPages/topRated/controller/top_rated_page_controller.dart';

class TopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopRatedPageController());
    Get.lazyPut(() => TopRatedSeriesController(Get.find<TVSeriesClient>()));
  }
}
