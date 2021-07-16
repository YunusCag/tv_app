import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/init/theme/theme_service.dart';
import 'package:tv_app/view/setting/controller/settings_page_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final SettingsPageController controller = Get.put(SettingsPageController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<SettingsPageController>(
        id: SettingsPageController.SETTINGS_PAGE_OBSERVE_ID,
        init: controller,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildChangeTheme(context),
            ],
          );
        },
      ),
    );
  }

  _buildChangeTheme(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 5,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => RadioListTile(
                  tileColor: Theme.of(context).cardColor,
                  title: Text(
                    "Light Theme",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  value: 0,
                  groupValue: controller.themeSelection.value,
                  onChanged: controller.changeTheme,
                ),
              ),
              Obx(
                () => RadioListTile(
                  tileColor: Theme.of(context).cardColor,
                  title: Text(
                    "Dark Theme",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  value: 1,
                  groupValue: controller.themeSelection.value,
                  onChanged: controller.changeTheme,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
