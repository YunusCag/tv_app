import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/view/common/view/components/skeleton/skeleton_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'horizontal_skeleton_list.dart';

class SkeletonDetail extends StatelessWidget {
  const SkeletonDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonContainer(
              width: double.infinity,
              height: 300.h,
              margin: EdgeInsets.zero,
            ),
            SizedBox(
              height: 10.h,
            ),
            SkeletonContainer(
              margin: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              width: 150.w,
              height: 15.h,
              borderRadius: BorderRadius.circular(4.r),
            ),
            SizedBox(
              height: 10.h,
            ),
            SkeletonContainer(
              margin: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              width: 200.w,
              height: 10.h,
              borderRadius: BorderRadius.circular(4.r),
            ),
            SizedBox(
              height: 10.h,
            ),
            SkeletonContainer(
              margin: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              width: 200.w,
              height: 10.h,
              borderRadius: BorderRadius.circular(4.r),
            ),
            SizedBox(
              height: 10.h,
            ),
            SkeletonContainer(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              height: 100.h,
              borderRadius: BorderRadius.circular(4.r),
            ),
            SizedBox(
              height: 10.h,
            ),
            SkeletonContainer(
              width: 100.w,
              height: 20.h,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
            SizedBox(
              height: 10.h,
            ),
            HorizontalSkeletonList(),
            SizedBox(
              height: 10.h,
            ),
            SkeletonContainer(
              width: 100.w,
              height: 20.h,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
            SizedBox(
              height: 10.h,
            ),
            HorizontalSkeletonList(),

          ],
        ),
      ),
    );
  }
}

