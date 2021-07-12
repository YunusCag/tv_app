import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/data/model/series/series_model.dart';
import 'package:tv_app/view/home/views/component/card/series_big_card.dart';

class StackedSeriesCarousel extends StatefulWidget {
  final List<SeriesModel?> seriesList;
  final void Function(int seriesId) onTap;

  StackedSeriesCarousel({
    Key? key,
    required this.seriesList,
    required this.onTap,
  }) : super(key: key);

  @override
  _StackedSeriesCarouselState createState() => _StackedSeriesCarouselState();
}

class _StackedSeriesCarouselState extends State<StackedSeriesCarousel> {
  final SwiperController _swiperController = SwiperController();

  @override
  void dispose() {
    this._swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height * 0.5,
      child: Swiper(
        controller: _swiperController,
        layout: SwiperLayout.STACK,
        itemWidth: Get.width * 0.8,
        itemCount: widget.seriesList.length,
        itemBuilder: (context, index) {
          final series = widget.seriesList[index];
          if (series != null) {
            return InkWell(
              onTap: () {
                widget.onTap(series.id ?? -1);
              },
              child: SeriesBigCard(
                series,
              ),
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
