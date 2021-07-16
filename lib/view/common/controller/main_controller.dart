import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:tv_app/core/constants/navigation/app_navigation.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:tv_app/view/common/model/enum/main_navigation_state.dart';

class MainController extends GetxController {
  final GlobalKey<NavigatorState> mainNavigation = GlobalKey<NavigatorState>();

  final pageTitle = RxString(LocalizationKeys.HOME_APP_BAR_TITLE);

  final backStack = Queue<MainNavigationState>();

  var currentTabIndex = RxInt(MainNavigationState.HOME.index);
  var currentNav = RxInt(MainNavigationState.HOME.index);

  final logger = Logger();

  void changePageTitle(String value) {
    pageTitle.value = value;
  }

  @override
  void onInit() {
    backStack.addLast(MainNavigationState.HOME);
    super.onInit();
  }

  bool onBackPressed() {
    bool check = mainNavigation.currentState?.canPop() == true;
    if (check) {
      if (backStack.isNotEmpty) {
        backStack.removeLast();
        final last = backStack.last;
        logger.d(backStack.toString() + "\n Last:${last.toString()}");

        currentNav.value = last.index;
        _getNavRouteName(last);
        update([NAVIGATION_OBSERVE_ID]);
      }

      mainNavigation.currentState?.pop();
    }
    return !check;
  }

  void onBottomNavBarTap(int index) {
    var state = MainNavigationState.values[index];
    navigate(state);
    update([NAVIGATION_OBSERVE_ID]);
  }

  void navigate(MainNavigationState state) {
    if (currentNav.value != state.index) {
      currentNav.value = state.index;
      if (checkStackContains(state)) {
        backStack.remove(state);
        backStack.addLast(state);
        mainNavigation.currentState
            ?.pushReplacementNamed(_getNavRouteName(state));
      } else {
        backStack.addLast(state);
        mainNavigation.currentState?.pushNamed(_getNavRouteName(state));
      }

      update([NAVIGATION_OBSERVE_ID]);
    }
  }

  bool checkStackContains(MainNavigationState state) {
    bool check = false;
    backStack.forEach((element) {
      if (element == state) {
        check = true;
      }
    });
    return check;
  }

  String _getNavRouteName(MainNavigationState state) {
    String route = AppNavigation.HOME_PAGE;
    int index = 0;

    String appBarTitleName = LocalizationKeys.HOME_APP_BAR_TITLE;
    switch (state) {
      case MainNavigationState.HOME:
        route = AppNavigation.HOME_PAGE;
        index = 0;
        appBarTitleName = LocalizationKeys.HOME_APP_BAR_TITLE;
        break;
      case MainNavigationState.POPULAR:
        route = AppNavigation.POPULAR_PAGE;
        index = 1;
        appBarTitleName = LocalizationKeys.POPULAR_APP_BAR_TITLE;
        break;
      case MainNavigationState.TOP_RATED:
        route = AppNavigation.TOP_RATED_PAGE;
        index = 2;
        appBarTitleName = LocalizationKeys.TOP_RATED_APP_BAR_TITLE;
        break;
      case MainNavigationState.SETTINGS:
        route = AppNavigation.SETTINGS_PAGE;
        index = currentTabIndex.value;
        appBarTitleName = LocalizationKeys.SETTINGS_PAGE_APP_BAR_TITLE;
        break;
    }
    currentTabIndex.value = index;
    changePageTitle(appBarTitleName);
    return route;
  }

  static const String NAVIGATION_OBSERVE_ID = "navigation_observe_id";
}
