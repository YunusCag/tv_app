import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/data/api/tv_series_service.dart';
import 'package:tv_app/core/data/model/series_model.dart';
import 'package:tv_app/core/constants/enum/enum.dart';

class PopularSeriesController extends GetxController {
  final TVSeriesService service;

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
    final response = await service.getPopularSeries(
        language: language, page: popularCurrentPage);
    if (response != null) {
      popularState = NetworkState.SUCCESS;
      this.popularTotalPage = response.totalPages ?? -1;

      final seriesList = response.popularList;
      if (seriesList != null && seriesList.isNotEmpty) {
        this.popularSeries.addAll(seriesList);
      }
    } else {
      popularState = NetworkState.ERROR;
    }
    update([popularID]);
  }

  void getPopularPagination({String language = "en-US"}) async {
    final response = await service.getPopularSeries(
        language: language, page: popularCurrentPage);
    if (response != null) {
      this.popularTotalPage = response.totalPages ?? -1;
      ++popularCurrentPage;
      final seriesList = response.popularList;
      if (seriesList != null && seriesList.isNotEmpty) {
        this.popularSeries.addAll(seriesList);
        update([popularID]);
      }
    }
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
