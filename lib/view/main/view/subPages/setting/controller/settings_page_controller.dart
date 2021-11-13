import 'package:get/get.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:tv_app/core/init/storage/local_storage_service.dart';
import 'package:tv_app/core/init/theme/theme_service.dart';

class SettingsPageController extends GetxController {
  var themeSelection = RxInt(LocalStorageService.instance.isDarkMode ? 1 : 0);
  var languageSelection = RxInt(0);

  @override
  void onInit() {
    initLanguageSelection();
    super.onInit();
  }

  void initLanguageSelection() {
    var deviceLang = Get.deviceLocale;

    switch (deviceLang?.languageCode) {
      case "en":
        languageSelection.value = 0;
        break;
      case "tr":
        languageSelection.value = 1;
        break;
      default:
        languageSelection.value = 0;
        break;
    }
  }

  void changeTheme(int? value) async {
    switch (value) {
      case 0:
        Get.changeTheme(ThemeService.instance.light);
        themeSelection.value = 0;
        break;
      case 1:
        Get.changeTheme(ThemeService.instance.dark);
        themeSelection.value = 1;
        break;

      default:
        Get.changeTheme(ThemeService.instance.light);
        themeSelection.value = 0;
        break;
    }
    update([SETTINGS_PAGE_OBSERVE_ID]);

    LocalStorageService.instance.isDarkMode = themeSelection.value == 1;
  }

  void changeLanguage(int? value) {
    String lang = "en";
    String country = "US";
    switch (value) {
      case 0:
        lang = "en";
        country = "US";
        languageSelection.value = 0;
        break;
      case 1:
        lang = "tr";
        country = "TR";
        languageSelection.value = 1;
        break;

      default:
        lang = "en";
        country = "US";
        languageSelection.value = 0;
        break;
    }
    LocalizationService.instance.changeLanguage(lang, country);
    update([SETTINGS_PAGE_OBSERVE_ID]);
  }

  static const String SETTINGS_PAGE_OBSERVE_ID = "settings_page_observe_id";
}
