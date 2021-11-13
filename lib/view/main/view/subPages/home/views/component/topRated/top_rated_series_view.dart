import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/base/view/base_network_view.dart';
import 'package:tv_app/view/common/components/animation/no_connection_container.dart';
import 'package:tv_app/view/main/view/subPages/home/controllers/home_controller.dart';
import 'package:tv_app/view/main/view/subPages/home/views/component/pageView/horizontal_series_carousel.dart';
import 'package:tv_app/view/main/view/subPages/home/views/component/shimmer/single_card_shimmer.dart';

class TopRatedSeriesView extends GetView<HomeController> {
  const TopRatedSeriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: HomeController.TOP_RATED_OBSERVE_ID,
      builder: (_) => BaseNetworkView(
        status: controller.topState,
        onLoading: SingleCardShimmer(),
        onError: NoInternetConnectionContainer(
          title:
          controller.topErrorMessage ?? "There is a unexpected error",
        ),
        onSuccess: HorizontalSeriesCarousel(
          seriesList: controller.topRateds,
          onTap: controller.onSeriesClick,
        ),
      ),
    );;
  }
}

