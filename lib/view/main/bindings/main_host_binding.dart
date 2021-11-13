import 'package:get/get.dart';
import 'package:tv_app/core/constants/url/api_url.dart';
import 'package:tv_app/core/init/network/interceptors/interceptors.dart';
import 'package:tv_app/view/main/controller/main_controller.dart';
import 'package:dio/dio.dart';

class MainHostBinding implements Bindings {
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
    Get.lazyPut(() => MainController());

  }
}
