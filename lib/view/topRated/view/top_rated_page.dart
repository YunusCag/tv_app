import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:tv_app/view/topRated/controller/top_rated_page_controller.dart';

import 'components/topRated/top_rated_series_view.dart';

class TopRatedPage extends GetView<TopRatedPageController> {
  const TopRatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backwardsCompatibility: false,
        brightness: Brightness.light,
        title: Text(
          LocalizationKeys.TOP_RATED_APP_BAR_TITLE.tr,
        ),
        backgroundColor: Colors.pink
            .withOpacity((controller.offset / 300).clamp(0, 1).toDouble()),
      ),
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: TopRatedSeriesView(),
          )
        ],
      ),
    );
  }
}
