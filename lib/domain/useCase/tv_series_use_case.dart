import 'package:dartz/dartz.dart';
import 'package:tv_app/core/base/model/base_error_model.dart';
import 'package:tv_app/core/base/model/base_pagination_model.dart';
import 'package:tv_app/core/data/model/series/series_model.dart';
import 'package:tv_app/core/data/repository/tv_series_repository.dart';

class TVSeriesUseCase {
  final TVSeriesRepository repository;

  TVSeriesUseCase({
    required this.repository,
  });

  Future<Either<BaseErrorModel?, BasePaginationModel<SeriesModel?>?>> getPopularSeries({
    String? languageCode,
    int page = 1,
  }) async {
    BaseErrorModel? model;
    BasePaginationModel<SeriesModel?>? pagination;

    final result = await repository.getPopularSeries(
        languageCode: languageCode, page: page);
    result.fold((error) {
      model = model;
    }, (seriesList) {
      pagination = seriesList;
    });

    if (result.isLeft()) {
      return Left(model);
    } else if (result.isRight()) {
      return Right(pagination);
    }
    return Left(model);
  }

  Future<Either<BaseErrorModel?, BasePaginationModel<SeriesModel?>?>> getTopRatedSeries({
    String? languageCode,
    int page = 1,
  }) async {
    BaseErrorModel? model;
    BasePaginationModel<SeriesModel?>? pagination;

    final result = await repository.getTopRatedSeries(
        languageCode: languageCode, page: page);
    result.fold((error) {
      model = model;
    }, (seriesList) {
      pagination = seriesList;
    });

    if (result.isLeft()) {
      return Left(model);
    } else if (result.isRight()) {
      return Right(pagination);
    }
    return Left(model);
  }
}
