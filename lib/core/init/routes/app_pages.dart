import 'package:get/get.dart';
import 'package:tv_app/view/common/bindings/main_host_binding.dart';
import 'package:tv_app/view/common/view/main_host_page.dart';
import 'package:tv_app/view/detail/bindings/detail_binding.dart';
import 'package:tv_app/view/detail/views/detail_page.dart';
import 'package:tv_app/view/home/bindings/home_binding.dart';
import 'package:tv_app/view/home/views/home_page.dart';
import 'package:tv_app/view/onboard/bindings/on_board_binding.dart';
import 'package:tv_app/view/onboard/view/on_board_page.dart';
import 'package:tv_app/view/popular/bindings/popular_binding.dart';
import 'package:tv_app/view/popular/view/popular_series_page.dart';
import 'package:tv_app/view/splash/bindings/splash_binding.dart';
import 'package:tv_app/view/splash/view/splash_page.dart';
import 'package:tv_app/view/topRated/bindings/top_binding.dart';
import 'package:tv_app/view/topRated/view/top_rated_page.dart';

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
    /*
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.POPULAR,
      page: () => PopularSeriesPage(),
      binding: PopularBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.TOP_RATED,
      page: () => TopRatedPage(),
      binding: TopBinding(),
      transition: Transition.rightToLeft,
    ),
     */
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailPage(),
      binding: DetailBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
