import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/enum/enum.dart';
import 'package:tv_app/view/common/components/grid/staggered_grid_series.dart';
import 'package:tv_app/view/common/controller/top_rated_series_controller.dart';

class TopRatedSeriesView extends GetView<TopRatedSeriesController> {

  const TopRatedSeriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopRatedSeriesController>(
      id: controller.topRatedID,
      builder: (_) {
        if (controller.topRatedState == NetworkState.LOADING) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (controller.topRatedState == NetworkState.SUCCESS) {
          return StaggeredGridSeries(
            seriesList: controller.topRatedSeries,
            controller: controller.scrollController,
            onTap: controller.onSeriesClick,
          );
        } else if (controller.topRatedState == NetworkState.ERROR) {
          return Container(
            child: Center(
              child: Text("There is a unexpected error"),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
