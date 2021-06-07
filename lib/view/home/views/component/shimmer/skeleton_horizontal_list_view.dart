import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/view/home/views/component/shimmer/single_card_shimmer.dart';
class SkeletonHorizontalListView extends StatelessWidget {
  const SkeletonHorizontalListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.5,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SingleCardShimmer(
          width: Get.width*0.4,
          height: Get.height*0.4,
          margin: const EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
    );
  }
}
