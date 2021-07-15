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
            style: Theme.of(context).textTheme.headline4?.copyWith(
              fontSize: 20.sp,
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
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "${firstAirDate}",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 12.sp,
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
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "${lastAirDate}",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 12.sp,
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
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "${seasonCount}",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 12.sp,
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
            style: Theme.of(context).textTheme.headline6?.copyWith(
              fontSize: 12.sp,
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
