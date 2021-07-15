import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/url/api_url.dart';
import 'package:tv_app/core/data/model/series/series_model.dart';
import 'package:tv_app/view/home/views/component/shimmer/single_card_shimmer.dart';

class SeriesSmallCard extends StatelessWidget {
  final SeriesModel series;
  double? width;
  double? height;

  SeriesSmallCard({Key? key, required this.series, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width ?? Get.width * 0.4,
      margin: const EdgeInsets.symmetric(
        horizontal: 6,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: this.height ?? Get.height * 0.35,
                  child: CachedNetworkImage(
                    imageUrl:
                        "${ApiUrl.IMAGE_URL}${series.posterPath ?? series.backdropPath}",
                    placeholder: (context, url) => Center(
                      child: SingleCardShimmer(),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(Icons.error),
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Text(
              "${series.name}",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
