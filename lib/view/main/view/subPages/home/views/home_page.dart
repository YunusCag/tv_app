import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:tv_app/view/main/view/subPages/home/controllers/home_controller.dart';
import 'package:tv_app/view/main/view/subPages/home/views/component/popular/popular_series.view.dart';
import 'package:tv_app/view/main/view/subPages/home/views/component/topRated/top_rated_series_view.dart';
import 'component/label/view_all_label.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
