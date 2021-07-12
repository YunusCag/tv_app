import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/url/api_url.dart';
import 'package:tv_app/core/data/model/series_detail_response_model.dart';
import 'package:tv_app/view/detail/views/header/detail_header.dart';
import 'package:tv_app/view/home/views/component/shimmer/single_card_shimmer.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

// ignore: must_be_immutable
class SeriesDetailView extends StatefulWidget {
  final SeriesDetailResponseModel model;

  SeriesDetailView({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _SeriesDetailViewState createState() => _SeriesDetailViewState();
}

class _SeriesDetailViewState extends State<SeriesDetailView> {
  late DateFormat dateFormat;

  late DateFormat parseFormat;

  void initFormatter() {
    initializeDateFormatting();
    dateFormat =
        DateFormat("dd MMMM yyyy", Get.deviceLocale?.languageCode ?? "en");
    parseFormat = DateFormat("yyyy-MM-dd");
  }

  String getFormattedDate(String date) {
    return dateFormat.format(parseFormat.parse(date));
  }

  @override
  void initState() {
    initFormatter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            "${widget.model.name ?? ""}",
          ),
          backgroundColor: Colors.pink,
          expandedHeight: Get.height * 0.5,
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            background: CachedNetworkImage(
              imageUrl:
                  "${ApiUrl.IMAGE_URL}${widget.model.posterPath ?? widget.model.backdropPath}",
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
              name: widget.model.name ?? "",
              overView: widget.model.overview ?? "",
              firstAirDate:
                  getFormattedDate(widget.model.firstAirDate ?? "1997-05-14"),
                lastAirDate: getFormattedDate(widget.model.lastAirDate?? "1997-05-14"),
            ),
          ),
        )
      ],
    );
  }
}
