import 'package:flutter/material.dart';

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
          onError: SizedBox.shrink(),
          onSuccess: SeriesDetailView(
            model: controller.seriesDetail.value,
          ),
        ),
      ),
    );
  }
}
