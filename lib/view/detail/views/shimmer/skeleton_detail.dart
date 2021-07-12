import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonDetail extends StatelessWidget {
  const SkeletonDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: Get.height * 0.5,
                color: Colors.grey[300]!,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: Get.width*0.5,
                height: 50,
                color: Colors.grey[300]!,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: Get.width*0.8,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: Get.height*0.3,
                color: Colors.grey[300]!,
              ),
            )
          ],
        ),
      ),
    );
  }
}
