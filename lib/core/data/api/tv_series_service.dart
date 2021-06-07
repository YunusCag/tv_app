import 'package:dio/dio.dart';
import 'package:tv_app/core/data/model/popular_series_response_model.dart';
import 'package:tv_app/core/data/model/series_detail_response_model.dart';
import 'package:tv_app/core/data/model/top_rated_series_response_model.dart';

import '../../constants/url/api_url.dart';

class TVSeriesService {
  final Dio dio;

  TVSeriesService(this.dio);

  Future<PopularSeriesResponseModel?> getPopularSeries(
      {String language = "en-US", int page = 1}) async {
    try {
      final response = await dio.get(ApiUrl.GET_POPULAR_SERIES,
          queryParameters: <String, dynamic>{
            "language": language,
            "page": page
          });

      if (response.statusCode == 200) {
        return PopularSeriesResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }

  Future<SeriesDetailResponseModel?> getSeriesDetail(int id,
      {String language = "en-US"}) async {
    try {
      final response = await dio.get(
        ApiUrl.GET_SERIES_DETAIL + "${id}",
        queryParameters: <String, dynamic>{
          "language": language,
        },
      );

      if (response.statusCode == 200) {
        return SeriesDetailResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }

  Future<TopRatedSeriesResponseModel?> getTopRatedSeries(
      {String language = "en-US", int page = 1}) async {
    try {
      final response = await dio.get(ApiUrl.GET_TOP_RATED_SERIES,
          queryParameters: <String, dynamic>{
            "language": language,
            "page": page
          });

      if (response.statusCode == 200) {
        return TopRatedSeriesResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }
}
