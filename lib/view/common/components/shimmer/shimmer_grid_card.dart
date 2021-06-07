import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerGridCard extends StatelessWidget {
  const ShimmerGridCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300]!,
          ),
        ),
      ),
    );
  }
}
