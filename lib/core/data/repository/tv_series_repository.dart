import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:tv_app/core/base/model/base_error_model.dart';
import 'package:tv_app/core/base/model/base_pagination_model.dart';
import 'package:tv_app/core/data/api/tv_series_client.dart';
import 'package:tv_app/core/data/model/credit/credit_response.dart';
import 'package:tv_app/core/data/model/detail/series_detail_response_model.dart';
import 'package:tv_app/core/data/model/series/series_model.dart';
import 'package:dio/dio.dart';

class TVSeriesRepository {
  final TVSeriesClient client;
  Logger? logger;

  TVSeriesRepository({
    required this.client,
    this.logger,
  });

  Future<Either<BaseErrorModel?, BasePaginationModel<SeriesModel?>?>>
      getPopularSeries({
    String? languageCode,
    int? page = 1,
  }) async {
    BaseErrorModel? errorResponse;
    BasePaginationModel<SeriesModel?>? series;

    try {
      final httpResponse = await client
          .getPopularSeries(
        language: languageCode,
        page: page,
      )
          .catchError((error) {
        errorResponse = getBaseErrorModel(error);
      });
      final responseModel = httpResponse.data;
      final response = httpResponse.response;
      if (response.requestOptions.validateStatus(response.statusCode)) {
        series = BasePaginationModel(
          data: responseModel?.popularList,
          current: responseModel?.page,
          totalPages: responseModel?.totalPages,
        );
        return Right(series);
      }
    } catch (exception) {
      return Left(BaseErrorModel(message: exception.toString()));
    }

    return Left(errorResponse);
  }

  Future<Either<BaseErrorModel?, BasePaginationModel<SeriesModel?>?>>
      getTopRatedSeries({
    String? languageCode,
    int? page = 1,
  }) async {
    BaseErrorModel? errorResponse;
    BasePaginationModel<SeriesModel?>? series;

    try {
      final httpResponse = await client
          .getTopRatedSeries(
        language: languageCode,
        page: page,
      )
          .catchError((error) {
        errorResponse = getBaseErrorModel(error);
      });
      final responseModel = httpResponse.data;
      final response = httpResponse.response;
      if (response.requestOptions.validateStatus(response.statusCode)) {
        series = BasePaginationModel(
          data: responseModel?.topRatedList,
          current: responseModel?.page,
          totalPages: responseModel?.totalPages,
        );
        return Right(series);
      }
    } catch (exception) {
      return Left(BaseErrorModel(message: exception.toString()));
    }

    return Left(errorResponse);
  }

  Future<Either<BaseErrorModel?, SeriesDetailResponseModel?>> getSeriesDetail({
    int? id,
    String? language,
  }) async {
    BaseErrorModel? errorModel;
    try {
      final httpResponse = await client
          .getSeriesDetail(
        id: id,
        language: language,
      )
          .catchError((error) {
        errorModel = getBaseErrorModel(error);
      });
      final responseModel = httpResponse.data;
      final response = httpResponse.response;
      if (response.requestOptions.validateStatus(response.statusCode)) {
        if (responseModel != null) {
          return Right(responseModel);
        }
      }
    } catch (exception) {
      return Left(errorModel);
    }
    return Left(errorModel);
  }

  Future<Either<BaseErrorModel?, CreditResponse?>> getSeriesCredit({
    int? id,
    String? language,
  }) async {
    BaseErrorModel? errorModel;
    try {
      final httpResponse = await client
          .getSeriesCredits(
        id: id,
        language: language,
      )
          .catchError((error) {
        errorModel = getBaseErrorModel(error);
      });
      final responseModel = httpResponse.data;
      final response = httpResponse.response;
      if (response.requestOptions.validateStatus(response.statusCode)) {
        if (responseModel != null) {
          return Right(responseModel);
        }
      }
    } catch (exception) {
      return Left(errorModel);
    }
    return Left(errorModel);
  }

  BaseErrorModel? getBaseErrorModel(error) {
    if (error is DioError) {
      var data = error.response?.data;
      if (data is Map<String, dynamic>) {
        return BaseErrorModel.fromJson(data);
      }

      return BaseErrorModel.fromJson(jsonDecode(data));
    }
    return null;
  }
}
