import 'package:get/get.dart';
import 'package:tv_app/core/data/api/tv_series_client.dart';
import 'package:tv_app/view/common/controller/main_controller.dart';
import 'package:tv_app/view/common/model/enum/main_navigation_state.dart';

class HomeController extends GetxController {
  final TVSeriesClient service;

  final MainController mainController = Get.find();

  HomeController(this.service);

  void navigatePopularPage() {
    mainController.navigate(MainNavigationState.POPULAR);
  }

  void navigateTopRatedPage() {
    mainController.navigate(MainNavigationState.TOP_RATED);
  }
}
