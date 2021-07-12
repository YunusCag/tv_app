import 'package:get/get.dart';
import 'package:tv_app/core/constants/navigation/app_navigation.dart';
import 'package:tv_app/core/data/api/tv_series_client.dart';

class HomeController extends GetxController {
  final TVSeriesClient service;

  HomeController(this.service);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void navigatePopularPage() {
    Get.toNamed(AppNavigation.POPULAR_PAGE);
  }

  void navigateTopRatedPage() {
    Get.toNamed(AppNavigation.TOP_RATED_PAGE);
  }
}
