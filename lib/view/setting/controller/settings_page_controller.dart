import 'package:get/get.dart';
import 'package:tv_app/core/init/storage/local_storage_service.dart';
import 'package:tv_app/core/init/theme/theme_service.dart';

class SettingsPageController extends GetxController {
  var themeSelection = RxInt(LocalStorageService.instance.isDarkMode ? 1 : 0);

  void changeTheme(int? value) async{
    switch (value) {
      case 0:
        Get.changeTheme(ThemeService.instance.light);
        themeSelection.value=0;
        break;
      case 1:
        Get.changeTheme(ThemeService.instance.dark);
        themeSelection.value=1;
        break;

      default:
        Get.changeTheme(ThemeService.instance.light);
        themeSelection.value=0;
        break;
    }
    update([SETTINGS_PAGE_OBSERVE_ID]);

    LocalStorageService.instance.isDarkMode=themeSelection.value==1;
  }

  static const String SETTINGS_PAGE_OBSERVE_ID = "settings_page_observe_id";
}
