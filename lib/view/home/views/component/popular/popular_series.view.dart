import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/enum/enum.dart';
import 'package:tv_app/view/common/components/animation/no_connection_container.dart';
import 'package:tv_app/view/common/controller/popular_series_controller.dart';
import 'package:tv_app/view/home/views/component/pageView/stacked_series_carousel.dart';
import 'package:tv_app/view/home/views/component/shimmer/single_card_shimmer.dart';

class PopularSeriesView extends GetView<PopularSeriesController> {
  const PopularSeriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularSeriesController>(
      id: controller.popularID,
      builder: (_) {
        if (controller.popularState == NetworkState.LOADING) {
          return SingleCardShimmer();
        } else if (controller.popularState == NetworkState.SUCCESS) {
          return StackedSeriesCarousel(
            seriesList: controller.popularSeries,
            onTap: controller.onSeriesClick,
          );
        } else if (controller.popularState == NetworkState.ERROR) {
          return NoInternetConnectionContainer(
            title: "There is a unexpected error",
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
