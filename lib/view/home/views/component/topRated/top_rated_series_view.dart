import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/enum/enum.dart';
import 'package:tv_app/view/common/components/animation/no_connection_container.dart';
import 'package:tv_app/view/common/controller/top_rated_series_controller.dart';
import 'package:tv_app/view/home/views/component/pageView/horizontal_series_carousel.dart';
import 'package:tv_app/view/home/views/component/shimmer/skeleton_horizontal_list_view.dart';

class TopRatedSeriesView extends GetView<TopRatedSeriesController> {
  const TopRatedSeriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopRatedSeriesController>(
      id: controller.topRatedID,
      builder: (_) {
        if (controller.topRatedState == NetworkState.LOADING) {
          return SkeletonHorizontalListView();
        } else if (controller.topRatedState == NetworkState.SUCCESS) {
          return HorizontalSeriesCarousel(
            seriesList: controller.topRatedSeries,
            onTap: controller.onSeriesClick,
          );
        } else if (controller.topRatedState == NetworkState.ERROR) {
          return NoInternetConnectionContainer(
            title: "There is a unexpected error",
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

