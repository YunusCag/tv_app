import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tv_app/core/constants/url/api_url.dart';
import 'package:tv_app/core/data/model/series_model.dart';
import 'package:tv_app/view/common/components/shimmer/shimmer_grid_card.dart';

// ignore: must_be_immutable
class GridSeriesItem extends StatelessWidget {
  final SeriesModel series;
  double? width;
  double? height;

  GridSeriesItem({
    Key? key,
    required this.series,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            child: CachedNetworkImage(
              imageUrl:
                  "${ApiUrl.IMAGE_URL}${series.posterPath ?? series.backdropPath}",
              placeholder: (context, url) => Center(
                child: ShimmerGridCard(),
              ),
              errorWidget: (context, url, error) => Center(
                child: Icon(Icons.error),
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Text(
              series.name ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Material(
            elevation: 0,
            color: Colors.black.withOpacity(0.3),
            shape: StadiumBorder(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 18,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "${series.voteAverage}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "/10",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
