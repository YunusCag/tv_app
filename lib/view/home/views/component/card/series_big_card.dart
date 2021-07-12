import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tv_app/core/constants/url/api_url.dart';
import 'package:tv_app/core/data/model/series/series_model.dart';
import 'package:tv_app/view/home/views/component/shimmer/single_card_shimmer.dart';

// ignore: must_be_immutable
class SeriesBigCard extends StatelessWidget {
  final SeriesModel series;
  double? width;
  double? height;

  SeriesBigCard(
    this.series, {
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key("${series.id}"),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  child: CachedNetworkImage(
                    imageUrl:
                        "${ApiUrl.IMAGE_URL}${series.posterPath ?? series.backdropPath}",
                    placeholder: (context, url) => Center(
                      child: SingleCardShimmer(),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(Icons.error),
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 24,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${series.voteAverage}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
