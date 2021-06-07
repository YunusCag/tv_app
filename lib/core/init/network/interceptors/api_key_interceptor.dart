import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tv_app/core/constants/url/api_url.dart';

class ApiKeyInterceptor extends Interceptor {
  final Logger logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters["api_key"] = ApiUrl.API_KEY;
    super.onRequest(options, handler);
  }
}
