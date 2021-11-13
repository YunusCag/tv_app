import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class SingleCardShimmer extends StatelessWidget {
  double? width;
  double? height;
  EdgeInsets? margin;
  SingleCardShimmer({Key? key, this.width, this.height,this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: this.margin,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width ?? Get.width * 0.8,
          height: height ?? Get.height * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[300]!,
          ),
        ),
      ),
    );
  }
}
