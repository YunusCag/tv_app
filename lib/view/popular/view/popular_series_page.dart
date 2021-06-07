import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:tv_app/view/popular/controller/popular_page_controller.dart';
import 'package:tv_app/view/popular/view/component/popular/popular_series_view.dart';

class PopularSeriesPage extends GetView<PopularPageController> {
  const PopularSeriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backwardsCompatibility: false,
        brightness: Brightness.light,
        title: Text(
          LocalizationKeys.POPULAR_APP_BAR_TITLE.tr,
        ),
        backgroundColor: Colors.pink
            .withOpacity((controller.offset / 300).clamp(0, 1).toDouble()),
      ),
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: PopularSeriesView(),
          )
        ],
      ),
    );
  }
}
