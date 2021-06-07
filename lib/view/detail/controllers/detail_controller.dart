import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:tv_app/core/constants/enum/enum.dart';
import 'package:tv_app/core/data/api/tv_series_service.dart';
import 'package:tv_app/core/data/model/series_detail_response_model.dart';

class DetailController extends GetxController {
  final TVSeriesService service;

  final Logger logger = Logger();

  DetailController(this.service);

  int seriesID = -1;
  final seriesDetail = SeriesDetailResponseModel().obs;
  NetworkState detailState = NetworkState.IDLE;

  @override
  void onInit() {
    seriesID = int.tryParse(Get.parameters["id"] ?? "-1") ?? -1;
    logger.d("SeriesId:${seriesID}");
    getSeriesDetail();
    super.onInit();
  }

  void getSeriesDetail() async {
    detailState = NetworkState.LOADING;
    if (seriesID != -1) {
      final response = await service.getSeriesDetail(seriesID);
      if (response != null) {
        this.detailState = NetworkState.SUCCESS;
        this.seriesDetail.value = response;
      } else {
        this.detailState = NetworkState.ERROR;
      }
    } else {
      detailState = NetworkState.ERROR;
    }
  }
}
