import 'package:get/get.dart';
import 'package:tv_app/core/constants/constants.dart';
import 'package:tv_app/core/data/model/series/series_model.dart';
import 'package:tv_app/domain/useCase/tv_series_use_case.dart';
import 'package:tv_app/view/main/controller/main_controller.dart';
import 'package:tv_app/view/common/model/enum/main_navigation_state.dart';

class HomeController extends GetxController {
  final TVSeriesUseCase useCase;

  HomeController({
    required this.useCase,
  });

  final populars = RxList<SeriesModel?>();
  NetworkState popularState = NetworkState.IDLE;
  String? popularErrorMessage;

  final topRateds = RxList<SeriesModel?>();
  NetworkState topState = NetworkState.IDLE;
  String? topErrorMessage;

  late final MainController mainController = Get.find();

  @override
  void onInit() {
    getPopular(
      page: 1,
    );
    getTopRated(
      page: 1,
    );

    super.onInit();
  }

  void navigatePopularPage() {
    mainController.navigate(MainNavigationState.POPULAR);
  }

  void navigateTopRatedPage() {
    mainController.navigate(MainNavigationState.TOP_RATED);
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
          final data=response.data;
          if(data!=null){
            this.populars.addAll(data);
          }

          this.popularState = NetworkState.SUCCESS;
          update([POPULAR_OBSERVE_ID]);
        }
      },
    );
  }

  Future<void> getTopRated({
    int page = 1,
    String language = "en-US",
  }) async {
    this.topState = NetworkState.LOADING;
    update([TOP_RATED_OBSERVE_ID]);

    final result = await useCase.getPopularSeries(
      page: page,
      languageCode: language,
    );
    result.fold(
      (error) {
        this.topErrorMessage = error?.message;
        this.topState = NetworkState.ERROR;
        update([TOP_RATED_OBSERVE_ID]);
      },
      (response) {
        if (response != null) {
          this.topRateds.clear();
          final data=response.data;
          if(data!=null){
            this.topRateds.addAll(data);
          }
          this.topState = NetworkState.SUCCESS;
          update([TOP_RATED_OBSERVE_ID]);
        }
      },
    );
  }

  void onSeriesClick(int seriesId) {
    Get.toNamed("/detail/${seriesId}");
  }

  static const String POPULAR_OBSERVE_ID = "popular_observe_id";
  static const String TOP_RATED_OBSERVE_ID = "top_rated_observe_id";
}
