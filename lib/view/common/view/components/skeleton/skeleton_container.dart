import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonContainer extends StatelessWidget {
  double? width;
  double? height;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  BorderRadiusGeometry? borderRadius;
  BoxShape shape;

  SkeletonContainer({
    Key? key,
    this.width,
    this.height,
    this.padding,
    this.margin = const EdgeInsets.only(right: 8),
    this.borderRadius = const BorderRadius.all(Radius.circular(2)),
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300] ?? Colors.grey,
      highlightColor: Colors.grey[100] ?? Colors.grey.withOpacity(0.3),
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: this.shape != BoxShape.circle ? borderRadius : null,
          shape: this.shape,
        ),
      ),
    );
  }
}
