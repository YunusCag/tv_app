import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:retrofit/dio.dart';
import 'package:tv_app/core/data/api/tv_series_client.dart';
import 'package:tv_app/core/data/model/series_model.dart';
import 'package:tv_app/core/constants/enum/enum.dart';

class PopularSeriesController extends GetxController {
  final TVSeriesClient service;

  PopularSeriesController(this.service);

  final ScrollController scrollController = ScrollController();

  final popularSeries = RxList<SeriesModel?>();
  int popularCurrentPage = 1;
  int popularTotalPage = -1;
  NetworkState popularState = NetworkState.IDLE;

  String popularID = "popularID1";

  @override
  void onInit() {
    getPopular();
    super.onInit();
    initScrollListener();
  }

  void getPopular({String language = "en-US"}) async {
    popularState = NetworkState.LOADING;
    update([popularID]);
    await service
        .getPopularSeries(language,popularCurrentPage)
        .then((response) {
      var popular = response.data;
      if (popular != null) {
        popularState = NetworkState.SUCCESS;
        this.popularTotalPage = popular.totalPages ?? -1;
        final seriesList = popular.popularList;
        if (seriesList != null && seriesList.isNotEmpty) {
          this.popularSeries.addAll(seriesList);
        }
      } else {
        popularState = NetworkState.ERROR;
      }
      update([popularID]);
    }).catchError((error) {
      final err=error as DioError;
      popularState = NetworkState.ERROR;

      update([popularID]);
    });
  }

  void getPopularPagination({String language = "en-US"}) async {
    await service
        .getPopularSeries(language,popularCurrentPage)
        .then((response) {
      var popular = response.data;
      if (popular != null) {
        this.popularTotalPage = popular.totalPages ?? -1;
        ++this.popularCurrentPage;
        final seriesList = popular.popularList;
        if (seriesList != null && seriesList.isNotEmpty) {
          this.popularSeries.addAll(seriesList);
          update([popularID]);

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
        getPopularPagination();
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
