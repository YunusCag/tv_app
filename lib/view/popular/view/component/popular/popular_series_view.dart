import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/enum/enum.dart';
import 'package:tv_app/view/common/components/grid/staggered_grid_series.dart';
import 'package:tv_app/view/common/controller/popular_series_controller.dart';

class PopularSeriesView extends GetView<PopularSeriesController> {

  const PopularSeriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularSeriesController>(
      id: controller.popularID,
      builder: (_) {
        if (controller.popularState == NetworkState.LOADING) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (controller.popularState == NetworkState.SUCCESS) {
          return StaggeredGridSeries(
            seriesList: controller.popularSeries,
            controller: controller.scrollController,
          );
        } else if (controller.popularState == NetworkState.ERROR) {
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
