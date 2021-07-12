import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/view/popular/controller/popular_page_controller.dart';
import 'package:tv_app/view/popular/view/component/popular/popular_series_view.dart';

class PopularSeriesPage extends GetView<PopularPageController> {
  const PopularSeriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller.scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: PopularSeriesView(),
        )
      ],
    );
  }
}
