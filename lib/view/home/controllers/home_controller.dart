import 'package:get/get.dart';
import 'package:tv_app/core/data/api/tv_series_client.dart';
import 'package:tv_app/view/common/controller/main_controller.dart';

class HomeController extends GetxController {
  final TVSeriesClient service;

  final MainController mainController = Get.find();

  HomeController(this.service);

  void navigatePopularPage() {
    mainController.onBottomNavBarTap(MainNavigationState.POPULAR.index);
  }

  void navigateTopRatedPage() {
    mainController.onBottomNavBarTap(MainNavigationState.TOP_RATED.index);
  }
}
