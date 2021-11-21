import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/base/view/base_network_view.dart';
import 'package:tv_app/view/detail/controllers/detail_controller.dart';
import 'package:tv_app/view/detail/views/detailView/series_detail_view.dart';
import 'package:tv_app/view/detail/views/shimmer/skeleton_detail.dart';

class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DetailController>(
        id: DetailController.DETAIL_OBSERVE_ID,
        builder: (_) => BaseNetworkView(
          status: controller.detailState,
          onLoading: SkeletonDetail(),
          onError: Center(
            child: Text(
              this.controller.detailErrorMessage??"",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          onSuccess: SeriesDetailView(
            model: controller.seriesDetail.value,
          ),
        ),
      ),
    );
  }
}
