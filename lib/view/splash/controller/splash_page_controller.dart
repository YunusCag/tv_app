import 'package:get/get.dart';
import 'package:tv_app/core/constants/navigation/app_navigation.dart';
import 'package:tv_app/core/init/assets/assets_path.dart';
import 'package:tv_app/core/init/storage/local_storage_service.dart';

class SplashPageController extends GetxController {
  final splashAnimation = AssetsPath.ANIMATION_SPLASH_PATH;

  @override
  void onReady() {
    super.onReady();
  }

  void navigateNextPage() async {
    await Future.delayed(Duration(seconds: 5));
    if (LocalStorageService.instance.isUserFirstTime) {
      Get.offAllNamed(AppNavigation.ON_BOARD_PAGE);
    } else {
      Get.offAllNamed(AppNavigation.HOME_PAGE);
    }
  }
}
