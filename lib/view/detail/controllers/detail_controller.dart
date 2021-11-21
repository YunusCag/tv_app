import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:tv_app/core/constants/enum/enum.dart';
import 'package:tv_app/core/data/model/credit/credit_model.dart';
import 'package:tv_app/core/data/model/detail/series_detail_response_model.dart';
import 'package:tv_app/core/data/model/video/video_model.dart';
import 'package:tv_app/domain/useCase/tv_series_use_case.dart';

class DetailController extends GetxController {

  final TVSeriesUseCase useCase;
  final Logger logger = Logger();

  DetailController( {
    required this.useCase,
  });

  final seriesDetail = SeriesDetailResponseModel().obs;
  NetworkState detailState = NetworkState.IDLE;
  String? detailErrorMessage;

  final casts = RxList<CreditModel?>();
  final crews = RxList<CreditModel?>();
  NetworkState creditState = NetworkState.IDLE;
  String? creditErrorMessage;

  final seriesVideo = RxList<VideoModel?>();
  NetworkState videoState = NetworkState.IDLE;

  @override
  void onInit() async {
    super.onInit();
    _getDetailPage();
  }

  void _getDetailPage() async {
    final int? id = int.tryParse(Get.parameters["id"] ?? "-1");

    await getSeriesDetail(id: id);
    await getCredit(id: id);
  }

  Future<void> getSeriesDetail({
    String language = "en_US",
    int? id,
  }) async {
    detailState = NetworkState.LOADING;
    update([DETAIL_OBSERVE_ID]);

    final result=await useCase.getSeriesDetail(
      id: id,
      language: language,
    );

    result.fold((error){
      this.detailErrorMessage = error?.message;
      detailState = NetworkState.ERROR;
      update([DETAIL_OBSERVE_ID]);
    }, (detail){
      if(detail!=null){
        this.seriesDetail.value = detail;
        this.detailState=NetworkState.SUCCESS;
        update([DETAIL_OBSERVE_ID]);
      }
    });
  }

  Future<void> getCredit({String language = "en_US", int? id}) async {
    creditState = NetworkState.LOADING;
    update([CREDIT_OBSERVE_ID]);

    final result=await useCase.getSeriesCredit(
      id: id,
      language: language,
    );

    result.fold((error){
      this.creditErrorMessage=error?.message;
      creditState = NetworkState.ERROR;
      update([CREDIT_OBSERVE_ID]);
    }, (creditResponse){
      final castList=creditResponse?.cast;
      final crewList=creditResponse?.crew;
      if(castList!=null){
        this.casts.addAll(castList);
      }
      if(crewList!=null){
        this.crews.addAll(crewList);
      }
      creditState = NetworkState.SUCCESS;
      update([CREDIT_OBSERVE_ID]);
    });
  }

  static const String DETAIL_OBSERVE_ID = "detail_observe_id";
  static const String CREDIT_OBSERVE_ID = "credit_observe_id";
}
