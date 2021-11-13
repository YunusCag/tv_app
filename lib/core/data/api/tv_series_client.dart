import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:tv_app/core/data/model/credit/credit_response.dart';
import 'package:tv_app/core/data/model/popular/popular_series_response_model.dart';
import 'package:tv_app/core/data/model/detail/series_detail_response_model.dart';
import 'package:tv_app/core/data/model/rated/top_rated_series_response_model.dart';
import 'package:tv_app/core/data/model/video/video_response.dart';

import '../../constants/url/api_url.dart';

part 'tv_series_client.g.dart';

@RestApi(baseUrl: ApiUrl.BASE_URL)
abstract class TVSeriesClient {
  factory TVSeriesClient(Dio dio, {String baseUrl}) = _TVSeriesClient;

  @GET(ApiUrl.GET_POPULAR_SERIES)
  Future<HttpResponse<PopularSeriesResponseModel?>> getPopularSeries({
    @Query("language") String? language,
    @Query("page") int? page,
  });

  @GET(ApiUrl.GET_SERIES_DETAIL)
  Future<HttpResponse<SeriesDetailResponseModel?>> getSeriesDetail(
    @Path("id") int id,
    @Query("language") String language,
  );

  @GET(ApiUrl.GET_TOP_RATED_SERIES)
  Future<HttpResponse<TopRatedSeriesResponseModel?>> getTopRatedSeries({
    @Query("language") String? language,
    @Query("page") int? page,
  });

  @GET(ApiUrl.GET_SERIES_CREDITS)
  Future<HttpResponse<CreditResponse?>> getSeriesCredits({
    @Path("id") int? id,
    @Query("language") String? language,
  });

  @GET(ApiUrl.GET_SERIES_VIDEOS)
  Future<HttpResponse<VideoResponse?>> getSeriesVideos({
    @Path("id") int? id,
    @Query("language") String? language,
  });
}
