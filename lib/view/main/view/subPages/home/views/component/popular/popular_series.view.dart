import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/base/view/base_network_view.dart';
import 'package:tv_app/view/common/components/animation/no_connection_container.dart';
import 'package:tv_app/view/main/view/subPages/home/controllers/home_controller.dart';
import 'package:tv_app/view/main/view/subPages/home/views/component/pageView/stacked_series_carousel.dart';
import 'package:tv_app/view/main/view/subPages/home/views/component/shimmer/single_card_shimmer.dart';

class PopularSeriesView extends GetView<HomeController> {
  const PopularSeriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: HomeController.POPULAR_OBSERVE_ID,
      builder: (_) => BaseNetworkView(
        status: controller.popularState,
        onLoading: SingleCardShimmer(),
        onError: NoInternetConnectionContainer(
          title:
              controller.popularErrorMessage ?? "There is a unexpected error",
        ),
        onSuccess: StackedSeriesCarousel(
          seriesList: controller.populars,
          onTap: controller.onSeriesClick,
        ),
      ),
    );
  }
}
