import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/data/model/detail/genre.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tv_app/core/init/theme/theme_service.dart';
import 'package:tv_app/view/common/components/label/label_with_color.dart';

class DetailHeader extends StatelessWidget {
  final String name;
  final String overView;
  final String firstAirDate;
  final String lastAirDate;
  final String seasonCount;
  final List<Genre?> genreList;

  DetailHeader({
    Key? key,
    required this.name,
    required this.overView,
    required this.firstAirDate,
    required this.lastAirDate,
    required this.seasonCount,
    required this.genreList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  LocalizationKeys.DETAIL_PAGE_FIRST_ON_AIR.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "${firstAirDate}",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  LocalizationKeys.DETAIL_PAGE_LAST_ON_AIR.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "${lastAirDate}",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  LocalizationKeys.DETAIL_PAGE_SEASON_COUNT_TEXT.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "${seasonCount}",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          _buildGenreList(),
          const SizedBox(
            height: 12,
          ),
          Text(
            overView,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  _buildGenreList() {
    return Container(
      width: double.infinity,
      height: 25.h,
      child: ListView.builder(
        itemCount: this.genreList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final genre = this.genreList[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: LabelWithColor(
              color: ThemeService.instance.getRandomColor(index),
              text: genre?.name ?? "",
            ),
          );
        },
      ),
    );
  }
}
