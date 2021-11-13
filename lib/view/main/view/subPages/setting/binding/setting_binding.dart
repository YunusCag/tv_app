import 'package:get/get.dart';
import 'package:tv_app/view/main/view/subPages/setting/controller/settings_page_controller.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsPageController());
  }


}
