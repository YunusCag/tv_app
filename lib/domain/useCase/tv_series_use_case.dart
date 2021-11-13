import 'package:dartz/dartz.dart';
import 'package:tv_app/core/base/model/base_error_model.dart';
import 'package:tv_app/core/data/model/series/series_model.dart';
import 'package:tv_app/core/data/repository/tv_series_repository.dart';

class TVSeriesUseCase {
  final TVSeriesRepository repository;

  TVSeriesUseCase({
    required this.repository,
  });

  Future<Either<BaseErrorModel?, List<SeriesModel?>?>> getPopularSeries({
    String? languageCode,
    int page = 1,
  }) async {
    BaseErrorModel? model;
    List<SeriesModel?>? series;

    final result = await repository.getTopRatedSeries(
        languageCode: languageCode, page: page);
    result.fold((error) {
      model = model;
    }, (seriesList) {
      series = seriesList;
    });

    if (result.isLeft()) {
      return Left(model);
    } else if (result.isRight()) {
      return Right(series);
    }
    return Left(model);
  }

  Future<Either<BaseErrorModel?, List<SeriesModel?>?>> getTopRatedSeries({
    String? languageCode,
    int page = 1,
  }) async {
    BaseErrorModel? model;
    List<SeriesModel?>? series;

    final result = await repository.getTopRatedSeries(
        languageCode: languageCode, page: page);
    result.fold((error) {
      model = model;
    }, (seriesList) {
      series = seriesList;
    });

    if (result.isLeft()) {
      return Left(model);
    } else if (result.isRight()) {
      return Right(series);
    }
    return Left(model);
  }
}
