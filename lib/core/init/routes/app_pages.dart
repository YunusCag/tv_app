import 'package:get/get.dart';
import 'package:tv_app/view/main/view/main_host_page.dart';
import 'package:tv_app/view/detail/bindings/detail_binding.dart';
import 'package:tv_app/view/detail/views/detail_page.dart';
import 'package:tv_app/view/main/bindings/main_host_binding.dart';
import 'package:tv_app/view/onboard/bindings/on_board_binding.dart';
import 'package:tv_app/view/onboard/view/on_board_page.dart';
import 'package:tv_app/view/splash/bindings/splash_binding.dart';
import 'package:tv_app/view/splash/view/splash_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.ON_BOARD,
      page: () => OnBoardPage(),
      binding: OnBoardBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainHostPage(),
      binding: MainHostBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailPage(),
      binding: DetailBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
