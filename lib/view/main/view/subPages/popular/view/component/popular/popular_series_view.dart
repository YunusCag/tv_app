import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/base/view/base_network_view.dart';
import 'package:tv_app/core/constants/enum/enum.dart';
import 'package:tv_app/view/common/components/animation/no_connection_container.dart';
import 'package:tv_app/view/common/components/grid/staggered_grid_series.dart';
import 'package:tv_app/view/common/controller/popular_series_controller.dart';
import 'package:tv_app/view/main/view/subPages/popular/controller/popular_page_controller.dart';

class PopularSeriesView extends GetView<PopularPageController> {

  const PopularSeriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularPageController>(
      id: PopularPageController.POPULAR_OBSERVE_ID,
      builder: (_)=>BaseNetworkView(
        status: controller.popularState,
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
        onError: NoInternetConnectionContainer(
          title: controller.popularErrorMessage ?? "Theres is un expected error",
        ),
        onSuccess: StaggeredGridSeries(
          seriesList: controller.populars,
          controller: controller.scrollController,
          onTap: controller.onSeriesClick,
        ),
      )
    );
  }
}
