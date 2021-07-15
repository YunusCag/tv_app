import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tv_app/view/common/view/components/skeleton/skeleton_container.dart';
class HorizontalSkeletonList extends StatelessWidget {
  const HorizontalSkeletonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w),

      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: 300.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Material(
                        borderRadius: BorderRadius.zero,
                        elevation: 5,
                        child: SkeletonContainer(
                          width: Get.width * 0.3,
                          height: 150.h,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                ),
                SkeletonContainer(
                  width: 100.w,
                  height: 10.h,
                  margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                ),
                SkeletonContainer(
                  width: 100.w,
                  height: 10.h,
                  margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
