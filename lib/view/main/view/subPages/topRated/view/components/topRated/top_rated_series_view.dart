import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/base/view/base_network_view.dart';
import 'package:tv_app/core/constants/enum/enum.dart';
import 'package:tv_app/view/common/components/animation/no_connection_container.dart';
import 'package:tv_app/view/common/components/grid/staggered_grid_series.dart';
import 'package:tv_app/view/common/controller/top_rated_series_controller.dart';
import 'package:tv_app/view/main/view/subPages/topRated/controller/top_rated_page_controller.dart';

class TopRatedSeriesView extends GetView<TopRatedPageController> {
  const TopRatedSeriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopRatedPageController>(
      id: TopRatedPageController.TOP_RATED_OBSERVE_ID,
      builder: (_) => BaseNetworkView(
        status: controller.topState,
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
        onError: NoInternetConnectionContainer(
          title: controller.topErrorMessage ?? "Theres is un expected error",
        ),
        onSuccess: StaggeredGridSeries(
          seriesList: controller.topRateds,
          controller: controller.scrollController,
          onTap: controller.onSeriesClick,
        ),
      ),
    );
  }
}
