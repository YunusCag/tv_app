import 'package:get/get.dart';
import 'package:tv_app/core/constants/url/api_url.dart';
import 'package:tv_app/core/data/api/tv_series_client.dart';
import 'package:tv_app/core/data/repository/tv_series_repository.dart';
import 'package:tv_app/core/init/network/interceptors/interceptors.dart';
import 'package:tv_app/domain/useCase/tv_series_use_case.dart';
import 'package:tv_app/view/detail/controllers/detail_controller.dart';
import 'package:dio/dio.dart';

class DetailBinding implements Bindings {
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
    Get.lazyPut(() => DetailController(
      useCase: TVSeriesUseCase(
        repository: TVSeriesRepository(
          client: TVSeriesClient(
            dio,
            baseUrl: ApiUrl.BASE_URL,
          )
        )
      )
    ));
  }
}
