import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tv_app/core/init/assets/assets_path.dart';

class NoInternetConnectionContainer extends StatefulWidget {
  final String title;

  const NoInternetConnectionContainer({Key? key, required this.title})
      : super(key: key);

  @override
  _NoInternetConnectionContainerState createState() =>
      _NoInternetConnectionContainerState();
}

class _NoInternetConnectionContainerState
    extends State<NoInternetConnectionContainer> with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Get.width,
          child: Center(
            child: Lottie.asset(
              AssetsPath.ANIMATION_NO_INTERNET_PATH,
              repeat: true,
              controller: _animationController,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
