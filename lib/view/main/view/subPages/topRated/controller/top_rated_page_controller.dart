import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/constants.dart';
import 'package:tv_app/core/data/model/series/series_model.dart';
import 'package:tv_app/domain/useCase/tv_series_use_case.dart';

class TopRatedPageController extends GetxController {
  final TVSeriesUseCase useCase;

  TopRatedPageController({
    required this.useCase,
  });

  late  ScrollController scrollController;

  final topRateds = RxList<SeriesModel?>();
  NetworkState topState = NetworkState.IDLE;
  String? topErrorMessage;
  int currentPage = 1;
  int totalPage = 1;

  @override
  void onInit() {
    scrollController = ScrollController();
    initScrollListener();

    getTopRateds(
      page: this.currentPage,
    );
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  void initScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        getPagination();
      }
    });
  }

  void getPagination() {
    if (this.topState == NetworkState.LOADING) {
      return;
    }
    final temp = this.currentPage + 1;
    if (temp <= this.totalPage) {
      this.currentPage = temp;
      getTopRateds(
        page: this.currentPage,
        isPagination: true,
      );
    }
  }

  Future<void> getTopRateds({
    int page = 1,
    String language = "en-US",
    bool isPagination = false,
  }) async {
    if (!isPagination) {
      this.topState = NetworkState.LOADING;
      update([TOP_RATED_OBSERVE_ID]);
    }

    final result = await useCase.getTopRatedSeries(
      page: page,
      languageCode: language,
    );
    result.fold(
          (error) {
        this.topErrorMessage = error?.message;
        if (!isPagination) {
          this.topState = NetworkState.ERROR;
          update([TOP_RATED_OBSERVE_ID]);
        }
      },
          (response) {
        if (response != null) {
          if (!isPagination) {
            this.topRateds.clear();
          }
          final data = response.data;
          this.currentPage = response.current ?? 1;
          this.totalPage = response.totalPages ?? 1;
          if (data != null) {
            this.topRateds.addAll(data);
          }
          this.topState = NetworkState.SUCCESS;
          update([TOP_RATED_OBSERVE_ID]);
        }
      },
    );
  }

  static const String TOP_RATED_OBSERVE_ID = "top_rated_observe_id";

  void onSeriesClick(int? seriesId) {
    Get.toNamed("/detail/${seriesId}");
  }
}
