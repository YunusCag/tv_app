import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:tv_app/view/home/views/component/popular/popular_series.view.dart';
import 'package:tv_app/view/home/views/component/topRated/top_rated_series_view.dart';
import '../controllers/home_controller.dart';
import 'component/label/view_all_label.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backwardsCompatibility: false,
          title: Text(LocalizationKeys.HOME_APP_BAR_TITLE.tr),
          backgroundColor: Colors.pink),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ViewAllLabel(
                title: LocalizationKeys.HOME_POPULAR_TITLE.tr,
                onTap: controller.navigatePopularPage,
              ),
              PopularSeriesView(),
              ViewAllLabel(
                title: LocalizationKeys.HOME_TOP_RATED_TITLE.tr,
                onTap: controller.navigateTopRatedPage,
              ),
              TopRatedSeriesView()
            ],
          ),
        ),
      ),
    );
  }
}