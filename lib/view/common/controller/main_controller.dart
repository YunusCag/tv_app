import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/navigation/app_navigation.dart';
import 'package:tv_app/core/init/lang/lang.dart';

class MainController extends GetxController {
  final GlobalKey<NavigatorState> mainNavigation = GlobalKey<NavigatorState>();

  final pageTitle = RxString(LocalizationKeys.HOME_APP_BAR_TITLE.tr);

  var currentIndex = RxInt(MainNavigationState.HOME.index);

  void changePageTitle(String value) {
    pageTitle.value = value;
  }

  bool onBackPressed() {
    bool check = mainNavigation.currentState?.canPop() == true;
    if (check) {
      mainNavigation.currentState?.pop();
    }
    return !check;

  }

  void onBottomNavBarTap(int index) {
    var state = MainNavigationState.values[index];
    currentIndex.value = index;
    switch (state) {
      case MainNavigationState.HOME:
        mainNavigation.currentState?.pushNamed(AppNavigation.HOME_PAGE);
        break;
      case MainNavigationState.POPULAR:
        mainNavigation.currentState?.pushNamed(AppNavigation.POPULAR_PAGE);
        break;
      case MainNavigationState.TOP_RATED:
        mainNavigation.currentState?.pushNamed(AppNavigation.TOP_RATED_PAGE);
        break;
    }
  }

  void checkCurrentRoute(String? route) {
    print(route);
    switch(route){
      case AppNavigation.HOME_PAGE:
        currentIndex.value=MainNavigationState.HOME.index;
        changePageTitle(LocalizationKeys.HOME_APP_BAR_TITLE.tr);
        break;
      case AppNavigation.POPULAR_PAGE:
        currentIndex.value=MainNavigationState.POPULAR.index;
        changePageTitle(LocalizationKeys.POPULAR_APP_BAR_TITLE.tr);
        break;
      case AppNavigation.TOP_RATED_PAGE:
        currentIndex.value=MainNavigationState.TOP_RATED.index;
        changePageTitle(LocalizationKeys.TOP_RATED_APP_BAR_TITLE.tr);
        break;
    }
  }
}

enum MainNavigationState {
  HOME,
  POPULAR,
  TOP_RATED,
}
