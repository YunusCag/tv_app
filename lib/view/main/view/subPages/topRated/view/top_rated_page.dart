import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/view/main/view/subPages/topRated/controller/top_rated_page_controller.dart';
import 'components/topRated/top_rated_series_view.dart';

class TopRatedPage extends GetView<TopRatedPageController> {
  const TopRatedPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller.scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: TopRatedSeriesView(),
        )
      ],
    );
  }
}
