import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/data/model/series_model.dart';
import 'package:tv_app/view/common/components/card/series_small_card.dart';

class HorizontalSeriesCarousel extends StatelessWidget {
  final List<SeriesModel?> seriesList;
  final void Function(int seriesId) onTap;

  HorizontalSeriesCarousel({
    Key? key,
    required this.seriesList,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      child: ListView.builder(
        itemCount: seriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final series = seriesList[index];
          if (series != null) {
            return InkWell(
              onTap: () {
                onTap(series.id ?? -1);
              },
              child: SeriesSmallCard(series: series),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
