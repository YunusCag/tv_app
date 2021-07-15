import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/navigation/app_navigation.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:tv_app/view/common/controller/main_controller.dart';
import 'package:tv_app/view/home/views/home_page.dart';
import 'package:tv_app/view/popular/view/popular_series_page.dart';
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
              controller.pageTitle.value,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                fontSize: 22.sp,
              ),
            ),
          ),
        ),
        body: Navigator(
          key: controller.mainNavigation,
          initialRoute: '/',
          onGenerateRoute: (settings) {
            Widget page;
            switch (settings.name) {
              case AppNavigation.HOME_PAGE:
                page = HomePage();
                controller
                    .changePageTitle(LocalizationKeys.HOME_APP_BAR_TITLE.tr);
                break;
              case AppNavigation.POPULAR_PAGE:
                page = PopularSeriesPage();
                controller
                    .changePageTitle(LocalizationKeys.POPULAR_APP_BAR_TITLE.tr);
                break;
              case AppNavigation.TOP_RATED_PAGE:
                page = TopRatedPage();
                controller.changePageTitle(
                    LocalizationKeys.TOP_RATED_APP_BAR_TITLE.tr);
                break;
              default:
                page = HomePage();
                controller
                    .changePageTitle(LocalizationKeys.HOME_APP_BAR_TITLE.tr);
                break;
            }
            return PageRouteBuilder(
              pageBuilder: (context, anim1,anim2) => page,
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(0.0, 1.0);
                var end = Offset.zero;
                var tween = Tween(begin: begin, end: end);
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },

              transitionDuration: const Duration(milliseconds: 500),
            );
          },
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
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
                  Icons.book,
                ),
                label: LocalizationKeys.POPULAR_APP_BAR_TITLE.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.book_outlined,
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
