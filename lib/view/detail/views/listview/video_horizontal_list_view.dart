import 'package:flutter/material.dart';
import 'package:tv_app/core/data/model/video/video_model.dart';

class VideoHorizontalListView extends StatelessWidget {
  final List<VideoModel?> videoList;
  final String? backgroundPath;

  const VideoHorizontalListView({
    Key? key,
    required this.videoList,
    required this.backgroundPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
