import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/url/api_url.dart';
import 'package:tv_app/core/data/api/tv_series_client.dart';
import 'package:tv_app/core/init/network/interceptors/interceptors.dart';
import 'package:tv_app/view/common/controller/popular_series_controller.dart';
import 'package:tv_app/view/common/controller/top_rated_series_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiUrl.BASE_URL,
        queryParameters: <String, dynamic>{"api_key": ApiUrl.API_KEY},
      ),
    );

    dio.interceptors.add(LoggerInterceptor());
    dio.interceptors.add(ApiKeyInterceptor());

    Get.put(dio, permanent: true);
    Get.put(TVSeriesClient(Get.find()), permanent: true);
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find()),
    );
    Get.lazyPut(
      () => PopularSeriesController(Get.find()),
    );
    Get.lazyPut(
      () => TopRatedSeriesController(Get.find()),
    );
  }
}
