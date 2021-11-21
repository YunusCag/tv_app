import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/base/view/base_network_view.dart';
import 'package:tv_app/core/constants/url/api_url.dart';
import 'package:tv_app/core/data/model/detail/series_detail_response_model.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:tv_app/view/detail/controllers/detail_controller.dart';
import 'package:tv_app/view/detail/views/header/detail_header.dart';
import 'package:tv_app/view/detail/views/listview/credit_horizontal_list_view.dart';
import 'package:tv_app/view/detail/views/listview/video_horizontal_list_view.dart';
import 'package:tv_app/view/detail/views/shimmer/credit_skeleton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tv_app/core/extension/string_extension.dart';
import 'package:get/get.dart';
import 'package:tv_app/view/main/view/subPages/home/views/component/shimmer/single_card_shimmer.dart';

// ignore: must_be_immutable
class SeriesDetailView extends StatelessWidget {
  final SeriesDetailResponseModel model;

  final DetailController controller = Get.find();

  SeriesDetailView({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            "${model.name ?? ""}",
          ),
          expandedHeight: 300.h,
          centerTitle: true,
          snap: true,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: CachedNetworkImage(
              imageUrl:
                  "${ApiUrl.IMAGE_URL}${model.posterPath ?? model.backdropPath}",
              placeholder: (context, url) => Center(
                child: SingleCardShimmer(),
              ),
              errorWidget: (context, url, error) => Center(
                child: Icon(Icons.error),
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          sliver: SliverToBoxAdapter(
            child: DetailHeader(
              name: model.name ?? "",
              overView: model.overview ?? "",
              firstAirDate: model.firstAirDate
                      ?.formatDate(outputFormat: "dd MMMM yyyy") ??
                  "",
              lastAirDate:
                  model.lastAirDate?.formatDate(outputFormat: "dd MMMM yyyy") ??
                      "",
              seasonCount: "${model.numberOfSeasons ?? 0}",
              genreList: model.genres ?? List.empty(),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          sliver: SliverToBoxAdapter(
            child: Container(
              child: GetBuilder<DetailController>(
                id: DetailController.CREDIT_OBSERVE_ID,
                builder: (_) => BaseNetworkView(
                  status: controller.creditState,
                  onError: Center(
                    child: Text(
                      this.controller.creditErrorMessage??"",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  onLoading: CreditSkeleton(),
                  onSuccess: Column(
                    children: [
                      CreditHorizontalListView(
                        credits: controller.casts,
                        title: LocalizationKeys.DETAIL_PAGE_CAST_TEXT.tr,
                        isCast: true,
                      ),
                      CreditHorizontalListView(
                        credits: controller.crews,
                        title: LocalizationKeys.DETAIL_PAGE_CREW_TEXT.tr,
                        isCast: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          sliver: SliverToBoxAdapter(
            child: Container(
              child: GetBuilder<DetailController>(
                id: DetailController.CREDIT_OBSERVE_ID,
                builder: (_) => BaseNetworkView(
                  status: controller.videoState,
                  onError: const SizedBox.shrink(),
                  onLoading: const SizedBox.shrink(),
                  onSuccess: VideoHorizontalListView(
                    videoList: controller.seriesVideo,
                    backgroundPath: controller.seriesDetail.value.backdropPath,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
