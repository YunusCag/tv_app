import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/enum/enum.dart';
import 'package:tv_app/core/data/api/tv_series_service.dart';
import 'package:tv_app/core/data/model/series_model.dart';

class TopRatedSeriesController extends GetxController {
  final TVSeriesService service;

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

    final response = await service.getTopRatedSeries(
        language: language, page: topRatedCurrentPage);
    if (response != null) {
      Future.delayed(Duration(seconds: 5));
      topRatedState = NetworkState.SUCCESS;
      this.topRatedTotalPage = response.totalPages ?? -1;

      final seriesList = response.topRatedList;
      if (seriesList != null && seriesList.isNotEmpty) {
        this.topRatedSeries.addAll(seriesList);
      }
    } else {
      topRatedState = NetworkState.ERROR;
    }
    update([topRatedID]);
  }

  void getTopRatedPagination({String language = "en-US"}) async {
    final response = await service.getTopRatedSeries(
        language: language, page: topRatedCurrentPage);
    if (response != null) {
      this.topRatedTotalPage = response.totalPages ?? -1;
      ++topRatedCurrentPage;
      final seriesList = response.topRatedList;
      if (seriesList != null && seriesList.isNotEmpty) {
        this.topRatedSeries.addAll(seriesList);
        update([topRatedID]);
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
        getTopRatedPagination();
      }
    });
  }
}
