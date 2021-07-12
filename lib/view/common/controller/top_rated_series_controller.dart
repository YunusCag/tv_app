import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/enum/enum.dart';
import 'package:tv_app/core/data/api/tv_series_client.dart';
import 'package:tv_app/core/data/model/series/series_model.dart';

class TopRatedSeriesController extends GetxController {
  final TVSeriesClient service;

  TopRatedSeriesController(this.service);

  final topRatedSeries = RxList<SeriesModel?>();
  int topRatedCurrentPage = 1;
  int topRatedTotalPage = -1;
  NetworkState topRatedState = NetworkState.IDLE;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    getTopRated();
    initScrollListener();
    super.onInit();
  }

  String topRatedID = "topRated1";

  void getTopRated({String language = "en-US"}) async {
    topRatedState = NetworkState.LOADING;
    update([topRatedID]);

    await service
        .getTopRatedSeries(language,topRatedCurrentPage)
        .then((response) {
      var topRated = response.data;
      if (topRated != null) {
        topRatedState = NetworkState.SUCCESS;
        this.topRatedTotalPage = topRated.totalPages ?? -1;
        var seriesList = topRated.topRatedList;
        if (seriesList != null && seriesList.isNotEmpty) {
          this.topRatedSeries.addAll(seriesList);
        }
      } else {
        topRatedState = NetworkState.ERROR;
      }
      update([topRatedID]);
    }).catchError((error) {
      topRatedState = NetworkState.ERROR;

      update([topRatedID]);
    });
  }

  void getTopRatedPagination({String language = "en-US"}) async {
    await service
        .getTopRatedSeries(language,topRatedCurrentPage)
        .then((response) {
      var topRated = response.data;
      if (topRated != null) {
        this.topRatedTotalPage = topRated.totalPages ?? -1;
        ++this.topRatedCurrentPage;
        final seriesList = topRated.topRatedList;
        if (seriesList != null && seriesList.isNotEmpty) {
          this.topRatedSeries.addAll(seriesList);
          update([topRatedID]);

        }
      } else {
      }
    }).catchError((error) {
      final err=error as DioError;
    });
  }

  void onSeriesClick(int? seriesId) {
    if (seriesId != null) {
      Get.toNamed("/detail/${seriesId}");
    }
  }

  void initScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        getTopRatedPagination();
      }
    });
  }
}
