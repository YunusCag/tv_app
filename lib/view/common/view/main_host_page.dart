import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/navigation/app_navigation.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:tv_app/view/common/controller/main_controller.dart';
import 'package:tv_app/view/common/model/enum/main_navigation_state.dart';
import 'package:tv_app/view/home/views/home_page.dart';
import 'package:tv_app/view/popular/view/popular_series_page.dart';
import 'package:tv_app/view/setting/view/settings_page.dart';
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
            key: controller.mainNavigation,
            initialRoute: '/',
            onGenerateRoute: (settings) {
              Widget page;
              switch (settings.name) {
                case AppNavigation.HOME_PAGE:
                  page = HomePage();
                  controller.changePageTitle(LocalizationKeys.HOME_APP_BAR_TITLE);
                  break;
                case AppNavigation.POPULAR_PAGE:
                  page = PopularSeriesPage();
                  controller
                      .changePageTitle(LocalizationKeys.POPULAR_APP_BAR_TITLE);
                  break;
                case AppNavigation.TOP_RATED_PAGE:
                  page = TopRatedPage();
                  controller
                      .changePageTitle(LocalizationKeys.TOP_RATED_APP_BAR_TITLE);
                  break;
                case AppNavigation.SETTINGS_PAGE:
                  page = SettingsPage();
                  controller.changePageTitle(
                    LocalizationKeys.SETTINGS_PAGE_APP_BAR_TITLE,
                  );
                  break;
                default:
                  page = HomePage();
                  controller.changePageTitle(LocalizationKeys.HOME_APP_BAR_TITLE);
                  break;
              }
              return PageRouteBuilder(
                pageBuilder: (context, anim1, anim2) => page,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = Offset(1, 0);
                  var end = Offset.zero;
                  var tween = Tween(begin: begin, end: end);
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
              );
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
