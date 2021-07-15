import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tv_app/view/common/view/components/skeleton/skeleton_container.dart';
import 'horizontal_skeleton_list.dart';
class CreditSkeleton extends StatelessWidget {
  const CreditSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        HorizontalSkeletonList(),
      ],
    );
  }
}
