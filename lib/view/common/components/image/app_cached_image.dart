import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedImage extends StatelessWidget {
  final String imageUrl;
  double? width;
  double? height;
  BoxFit? fit;

  AppCachedImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "$imageUrl",
      placeholder: (context, url) => Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      fit: this.fit,
      width: this.width,
      height: this.height,

      errorWidget: (context, url, _) => Container(),
    );
  }
}
