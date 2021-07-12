import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:tv_app/core/constants/enum/enum.dart';
import 'package:tv_app/core/data/api/tv_series_client.dart';
import 'package:tv_app/core/data/model/series_detail_response_model.dart';

class DetailController extends GetxController {
  final TVSeriesClient service;

  final Logger logger = Logger();

  DetailController(this.service);

  final seriesDetail = SeriesDetailResponseModel().obs;
  NetworkState detailState = NetworkState.IDLE;

  final String detailObserveID = "seriesID";

  @override
  void onInit() {
    super.onInit();
    getSeriesDetail();
  }


  void getSeriesDetail({String language = "en_US"}) async {
    detailState = NetworkState.LOADING;
    update([detailObserveID]);
    await Future.delayed(Duration(seconds: 10));
    final seriesID = int.tryParse(Get.parameters["id"] ?? "-1") ?? -1;

    if (seriesID != -1) {
      await service.getSeriesDetail(seriesID, language).then((response) {
        var detail = response.data;
        if (detail != null) {
          this.detailState = NetworkState.SUCCESS;
          this.seriesDetail.value = detail;
        } else {
          detailState = NetworkState.ERROR;
        }
        update([detailObserveID]);
      }).catchError((error) {
        print(error.toString());
        var err = error as DioError;
        detailState = NetworkState.ERROR;
        update([detailObserveID]);
      });
    }
  }
}
