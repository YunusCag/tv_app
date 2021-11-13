import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/url/api_url.dart';
import 'package:tv_app/core/data/api/tv_series_client.dart';
import 'package:tv_app/core/data/repository/tv_series_repository.dart';
import 'package:tv_app/core/init/network/interceptors/interceptors.dart';
import 'package:tv_app/domain/useCase/tv_series_use_case.dart';
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

    dio.interceptors.add(ApiKeyInterceptor());
    dio.interceptors.add(LoggerInterceptor());

    Get.put(dio, permanent: true);

    Get.put(
        TVSeriesClient(
          Get.find(),
          baseUrl: ApiUrl.BASE_URL,
        ),
        permanent: true);

    TVSeriesRepository tvSeriesRepository =
        TVSeriesRepository(client: Get.find());
    Get.lazyPut(() => tvSeriesRepository);

    TVSeriesUseCase useCase = TVSeriesUseCase(repository: Get.find());
    Get.lazyPut(() => useCase);

    Get.lazyPut<HomeController>(
      () => HomeController(
        useCase: Get.find(),
      ),
    );
    Get.lazyPut(
      () => PopularSeriesController(Get.find()),
    );
    Get.lazyPut(
      () => TopRatedSeriesController(Get.find()),
    );
  }
}
