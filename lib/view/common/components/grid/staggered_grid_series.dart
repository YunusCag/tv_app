import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/data/model/series_model.dart';
import 'package:tv_app/view/common/components/card/grid_series_item.dart';

class StaggeredGridSeries extends StatelessWidget {
  final List<SeriesModel?> seriesList;
  final ScrollController controller;

  const StaggeredGridSeries({
    Key? key,
    required this.seriesList,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        controller: controller,
        itemCount: seriesList.length,
        itemBuilder: (context, index) {
          final series = seriesList[index];

          if (series != null) {
            return GridSeriesItem(
              series: series,
            );
          }
          return SizedBox.shrink();
        },
        staggeredTileBuilder: (int index) {
          //final position = index % _staggeredTiles.length;
          //return _staggeredTiles[position];
          int crossCell = 1;
          int mainCell = 1;
          if (index % 3 == 0) {
            crossCell = 2;
            mainCell = 1;
          }
          if (index % 6 == 0) {
            mainCell = 2;
          }

          return StaggeredTile.count(crossCell, mainCell.toDouble());
        },
      ),
    );
  }
}
