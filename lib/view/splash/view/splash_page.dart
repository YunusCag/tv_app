import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:tv_app/core/init/storage/local_storage_service.dart';
import 'package:tv_app/view/splash/controller/splash_page_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  SplashPageController controller = Get.find();
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animationController.forward();
    super.initState();
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) => controller.navigateNextPage());
  }

  @override
  void dispose() {
    controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 300.h,
            child: Center(
              child: Lottie.asset(
                controller.splashAnimation,
                controller: _animationController,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: AnimatedTextKit(
              isRepeatingAnimation: true,
              animatedTexts: [
                WavyAnimatedText(
                  "${LocalizationKeys.APP_NAME.tr}",
                  speed: const Duration(milliseconds: 400),
                  textStyle: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
