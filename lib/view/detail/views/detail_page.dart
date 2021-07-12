import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tv_app/core/constants/constants.dart';
import 'package:tv_app/view/detail/controllers/detail_controller.dart';
import 'package:tv_app/view/detail/views/detailView/series_detail_view.dart';
import 'package:tv_app/view/detail/views/shimmer/skeleton_detail.dart';

class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DetailController>(
        id: controller.detailObserveID,
        builder: (_) {
          if (controller.detailState == NetworkState.LOADING) {
            return SkeletonDetail();
          } else if (controller.detailState == NetworkState.SUCCESS) {
            return SeriesDetailView(model: controller.seriesDetail.value);
          } else if (controller.detailState == NetworkState.ERROR) {}
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
