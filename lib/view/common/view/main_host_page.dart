import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/navigation/app_navigation.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:tv_app/view/common/controller/main_controller.dart';
import 'package:tv_app/view/common/model/enum/main_navigation_state.dart';
import 'package:tv_app/view/home/bindings/home_binding.dart';
import 'package:tv_app/view/home/views/home_page.dart';
import 'package:tv_app/view/popular/bindings/popular_binding.dart';
import 'package:tv_app/view/popular/view/popular_series_page.dart';
import 'package:tv_app/view/setting/binding/setting_binding.dart';
import 'package:tv_app/view/setting/view/settings_page.dart';
import 'package:tv_app/view/topRated/bindings/top_binding.dart';
import 'package:tv_app/view/topRated/view/top_rated_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainHostPage extends GetView<MainController> {
  const MainHostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return controller.onBackPressed();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Obx(
            () => Text(
              controller.pageTitle.value.tr,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 22.sp,
                  ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                controller.navigate(MainNavigationState.SETTINGS);
              },
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 24.sp,
              ),
            ),
          ],
        ),
        body: SizedBox.expand(
          child: Navigator(
            key: Get.nestedKey(controller.navId),
            initialRoute: '/',
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case AppNavigation.HOME_PAGE:
                  controller
                      .changePageTitle(LocalizationKeys.HOME_APP_BAR_TITLE);

                  return GetPageRoute(
                    routeName: AppNavigation.HOME_PAGE,
                    page: () => HomePage(),
                    binding: HomeBinding(),
                    transition: Transition.rightToLeft,
                  );
                case AppNavigation.POPULAR_PAGE:
                  controller
                      .changePageTitle(LocalizationKeys.POPULAR_APP_BAR_TITLE);
                  return GetPageRoute(
                    routeName: AppNavigation.POPULAR_PAGE,
                    page: () => PopularSeriesPage(),
                    binding: PopularBinding(),
                    transition: Transition.rightToLeft,
                  );
                case AppNavigation.TOP_RATED_PAGE:
                  controller.changePageTitle(
                      LocalizationKeys.TOP_RATED_APP_BAR_TITLE);
                  return GetPageRoute(
                      routeName: AppNavigation.TOP_RATED_PAGE,
                      page: () => TopRatedPage(),
                      binding: TopBinding(),
                    transition: Transition.rightToLeft,
                  );
                case AppNavigation.SETTINGS_PAGE:
                  controller.changePageTitle(
                    LocalizationKeys.SETTINGS_PAGE_APP_BAR_TITLE,
                  );
                  return GetPageRoute(
                    routeName: AppNavigation.SETTINGS_PAGE,
                    page: () => SettingsPage(),
                    binding: SettingBinding(),
                    transition: Transition.upToDown,
                  );
                default:
                  controller
                      .changePageTitle(LocalizationKeys.HOME_APP_BAR_TITLE);
                  return GetPageRoute(
                    routeName: AppNavigation.HOME_PAGE,
                    page: () => HomePage(),
                    binding: HomeBinding(),
                    transition: Transition.leftToRight,
                  );
              }
            },
          ),
        ),
        bottomNavigationBar: GetBuilder<MainController>(
          init: controller,
          id: MainController.NAVIGATION_OBSERVE_ID,
          builder: (_) => BottomNavigationBar(
            currentIndex: controller.currentTabIndex.value,
            onTap: controller.onBottomNavBarTap,
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: LocalizationKeys.HOME_APP_BAR_TITLE.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.hd_outlined,
                ),
                label: LocalizationKeys.POPULAR_APP_BAR_TITLE.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.tv_outlined,
                ),
                label: LocalizationKeys.TOP_RATED_APP_BAR_TITLE.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
