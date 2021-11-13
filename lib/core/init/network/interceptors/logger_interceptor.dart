import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tv_app/core/constants/url/api_url.dart';

class LoggerInterceptor extends Interceptor {
  final Logger logger = Logger();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.e("OnError:${err.message}");
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d("OnRequest:\n Url:${options.uri.toString()}\n Data:${options.data}\n Query:${options.queryParameters}\n Header:${options.headers}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d("OnResponse:${response.data}");
    super.onResponse(response, handler);
  }
}
