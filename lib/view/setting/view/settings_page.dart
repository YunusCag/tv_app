import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/app/app_constant.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:tv_app/core/init/theme/theme_service.dart';
import 'package:tv_app/view/common/components/animation/slide_transition_container.dart';
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
              SizedBox(
                height: 10.h,
              ),
              _buildChangeLanguage(context)
            ],
          );
        },
      ),
    );
  }

  Widget _buildChangeTheme(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: SlideTransitionContainer(
        begin: Offset(-1, 0),
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
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 12.w,
                  ),
                  child: Text(
                    LocalizationKeys.SETTINGS_PAGE_THEME_SELECTION_TEXT.tr,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 18.sp,
                        ),
                  ),
                ),
                Obx(
                  () => RadioListTile(
                    tileColor: Theme.of(context).cardColor,
                    title: Text(
                      LocalizationKeys.SETTINGS_PAGE_LIGHT_THEME_TEXT.tr,
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
                      LocalizationKeys.SETTINGS_PAGE_DARK_THEME_TEXT.tr,
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
      ),
    );
  }

  Widget _buildChangeLanguage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: SlideTransitionContainer(
        begin: Offset(-1, 0),
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
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 12.w,
                  ),
                  child: Text(
                    LocalizationKeys.SETTINGS_PAGE_LANGUAGE_SELECTION_TEXT.tr,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 18.sp,
                        ),
                  ),
                ),
                Obx(
                  () => RadioListTile(
                    tileColor: Theme.of(context).cardColor,
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            AppConstant.SVG_USA_FLAG,
                            width: 24.w,
                            height: 24.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            LocalizationKeys.SETTINGS_PAGE_LANGUAGE_ENGLISH.tr,
                            style: Theme.of(context).textTheme.headline6?.copyWith(
                                  fontSize: 16.sp,
                                ),
                          ),
                        ),
                      ],
                    ),
                    value: 0,
                    groupValue: controller.languageSelection.value,
                    onChanged: controller.changeLanguage,
                  ),
                ),
                Obx(
                  () => RadioListTile(
                    tileColor: Theme.of(context).cardColor,
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            AppConstant.SVG_TURKISH_FLAG,
                            width: 24.w,
                            height: 24.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            LocalizationKeys.SETTINGS_PAGE_LANGUAGE_TURKISH.tr,
                            style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    value: 1,
                    groupValue: controller.languageSelection.value,
                    onChanged: controller.changeLanguage,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
