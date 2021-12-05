import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/constants.dart';
import 'package:tv_app/core/data/model/series/series_model.dart';
import 'package:tv_app/domain/useCase/tv_series_use_case.dart';

class PopularPageController extends GetxController {
  final TVSeriesUseCase useCase;

  PopularPageController({
    required this.useCase,
  });

  late ScrollController scrollController;

  final populars = RxList<SeriesModel?>();
  NetworkState popularState = NetworkState.IDLE;
  String? popularErrorMessage;
  int currentPage = 1;
  int totalPage = 1;

  @override
  void onInit() {
    scrollController = ScrollController();
    initScrollListener();

    getPopular(
      page: this.currentPage,
    );
    super.onInit();
  }
  void initScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        getPagination();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  void getPagination() {
    if (this.popularState == NetworkState.LOADING) {
      return;
    }
    final temp = this.currentPage + 1;
    if (temp <= this.totalPage) {
      this.currentPage = temp;
      getPopular(
        page: this.currentPage,
        isPagination: true,
      );
    }
  }

  Future<void> getPopular({
    int page = 1,
    String language = "en-US",
    bool isPagination = false,
  }) async {
    if (!isPagination) {
      this.popularState = NetworkState.LOADING;
      update([POPULAR_OBSERVE_ID]);
    }

    final result = await useCase.getPopularSeries(
      page: page,
      languageCode: language,
    );
    result.fold(
      (error) {
        this.popularErrorMessage = error?.message;
        if (!isPagination) {
          this.popularState = NetworkState.ERROR;
          update([POPULAR_OBSERVE_ID]);
        }
      },
      (response) {
        if (response != null) {
          if (!isPagination) {
            this.populars.clear();
          }
          final data = response.data;
          this.currentPage = response.current ?? 1;
          this.totalPage = response.totalPages ?? 1;
          if (data != null) {
            this.populars.addAll(data);
          }
          this.popularState = NetworkState.SUCCESS;
          update([POPULAR_OBSERVE_ID]);
        }
      },
    );
  }

  static const String POPULAR_OBSERVE_ID = "popular_observe_id";

  void onSeriesClick(int? seriesId) {
    Get.toNamed("/detail/${seriesId}");
  }
}
