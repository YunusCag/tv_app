import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:tv_app/core/constants/enum/enum.dart';
import 'package:tv_app/core/data/api/tv_series_client.dart';
import 'package:tv_app/core/data/model/credit/credit_model.dart';
import 'package:tv_app/core/data/model/credit/credit_response.dart';
import 'package:tv_app/core/data/model/detail/series_detail_response_model.dart';
import 'package:tv_app/core/data/model/video/video_model.dart';

class DetailController extends GetxController {
  final TVSeriesClient service;

  final Logger logger = Logger();

  DetailController(this.service);

  final seriesDetail = SeriesDetailResponseModel().obs;
  NetworkState detailState = NetworkState.IDLE;

  final casts=RxList<CreditModel?>();
  final crews=RxList<CreditModel?>();
  NetworkState creditState = NetworkState.IDLE;

  final seriesVideo = RxList<VideoModel?>();
  NetworkState videoState = NetworkState.IDLE;


  @override
  void onInit() {
    super.onInit();
    final int? id = int.tryParse(Get.parameters["id"] ?? "-1");
    getSeriesDetail(id: id);
    getCredit(id: id);
    getVideos(id: id);
  }

  void getSeriesDetail({
    String language = "en_US",
    int? id,
  }) async {
    detailState = NetworkState.LOADING;
    update([DETAIL_OBSERVE_ID]);
    final seriesID = id ?? -1;

    if (seriesID != -1) {
      await service.getSeriesDetail(seriesID, language).then((response) {
        var detail = response.data;
        if (detail != null) {
          this.detailState = NetworkState.SUCCESS;
          this.seriesDetail.value = detail;
        } else {
          detailState = NetworkState.ERROR;
        }
        update([DETAIL_OBSERVE_ID]);
      }).catchError((error) {
        print(error.toString());
        var err = error as DioError;
        detailState = NetworkState.ERROR;
        update([DETAIL_OBSERVE_ID]);
      });
    }
  }

  Future<void> getCredit({String language = "en_US", int? id}) async {
    try {
      creditState = NetworkState.LOADING;
      update([CREDIT_OBSERVE_ID]);
      final seriesID = id ?? -1;
      if (seriesID != -1) {
        await service
            .getSeriesCredits(id: seriesID, language: language)
            .then((response) {
          var credits = response.data;
          if (credits != null) {
            this.creditState = NetworkState.SUCCESS;
            final castList=credits.cast;
            final crewList=credits.crew;
            if(castList!=null&&crewList!=null){
              casts.addAll(castList);
              crews.addAll(crewList);
            }
          } else {
            creditState = NetworkState.ERROR;
          }
          update([CREDIT_OBSERVE_ID]);
        }).catchError((error) {
          print(error.toString());
          var err = error as DioError;
          creditState = NetworkState.ERROR;
          update([CREDIT_OBSERVE_ID]);
        });
      }
    } catch (exception) {}
  }

  Future<void> getVideos({String language = "en_US", int? id}) async {
    try {
      videoState = NetworkState.LOADING;
      update([VIDEOS_OBSERVE_ID]);
      final seriesID = id ?? -1;
      if (seriesID != -1) {
        await service
            .getSeriesVideos(id: seriesID, language: language)
            .then((response) {
          var credits = response.data;
          var videoList = credits?.videoList;
          if (credits != null && videoList != null) {
            this.videoState = NetworkState.SUCCESS;
            this.seriesVideo.addAll(videoList);
          } else {
            videoState = NetworkState.ERROR;
          }
          update([VIDEOS_OBSERVE_ID]);
        }).catchError((error) {
          print(error.toString());
          var err = error as DioError;
          videoState = NetworkState.ERROR;
          update([VIDEOS_OBSERVE_ID]);
        });
      }
    } catch (exception) {}
  }

  static const String DETAIL_OBSERVE_ID = "detail_observe_id";
  static const String CREDIT_OBSERVE_ID = "credit_observe_id";
  static const String VIDEOS_OBSERVE_ID = "videos_observe_id";
}
