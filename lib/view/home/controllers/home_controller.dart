import 'package:get/get.dart';
import 'package:tv_app/core/constants/navigation/app_navigation.dart';
import 'package:tv_app/core/data/api/tv_series_service.dart';
import 'package:tv_app/core/init/storage/local_storage_service.dart';

class HomeController extends GetxController {
  final TVSeriesService service;

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
