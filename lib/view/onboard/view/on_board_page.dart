import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/navigation/app_navigation.dart';
import 'package:tv_app/core/init/assets/assets_path.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:tv_app/core/init/storage/local_storage_service.dart';
import 'package:tv_app/view/onboard/controller/on_board_page_controller.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:tv_app/view/onboard/view/components/introduction_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardPage extends StatefulWidget {
  OnBoardPage({
    Key? key,
  }) : super(key: key);

  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  int page = 0;

  OnBoardPageController controller = Get.find();

  final List<Widget> pages = [
    IntroductionPage(
      color: Colors.red,
      title: LocalizationKeys.ON_BOARD_PAGE_TITLE_1.tr,
      description: LocalizationKeys.ON_BOARD_PAGE_DESCRIPTION_1.tr,
      assetImage: AssetsPath.IMAGES_THE_MOVIE_DB_LOGO_PATH,
    ),
    IntroductionPage(
      color: Colors.blue,
      title: LocalizationKeys.ON_BOARD_PAGE_TITLE_2.tr,
      description: LocalizationKeys.ON_BOARD_PAGE_DESCRIPTION_2.tr,
      assetImage: AssetsPath.IMAGES_THE_MOVIE_DB_LOGO_PATH,
    ),
    IntroductionPage(
      color: Colors.purple,
      title: LocalizationKeys.ON_BOARD_PAGE_TITLE_3.tr,
      description: LocalizationKeys.ON_BOARD_PAGE_DESCRIPTION_3.tr,
      assetImage: AssetsPath.IMAGES_THE_MOVIE_DB_LOGO_PATH,
      isLast: true,
      onPress: () {
        LocalStorageService.instance.isUserFirstTime = false;
        Get.offAllNamed(AppNavigation.MAIN_HOST_PAGE);
      },
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: LiquidSwipe(
              pages: pages,
              slideIconWidget: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 32,
              ),
              onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: controller.liquidController,
              ignoreUserGestureWhileAnimating: true,
              enableSideReveal: true,
              fullTransitionValue: FULL_TRANSITION_PX,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SizedBox(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(pages.length, _buildDot),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      controller.liquidController
                          .animateToPage(page: pages.length - 1, duration: 700);
                    },
                    child: Text(
                      LocalizationKeys.ON_BOARD_PAGE_SKIP_TEXT.tr,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0.r),
                          side: BorderSide(
                            color: Colors.white,
                            width: 5.w,
                          ),
                        ),
                      ),
                      overlayColor: MaterialStateProperty.all(
                        Colors.pink.withOpacity(0.4),
                      ),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      controller.liquidController.animateToPage(
                          page: controller.liquidController.currentPage + 1 >
                                  pages.length - 1
                              ? 0
                              : controller.liquidController.currentPage + 1);
                    },
                    child: Text(
                      LocalizationKeys.ON_BOARD_PAGE_NEXT_TEXT.tr,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0.r),
                          side: BorderSide(
                            color: Colors.white,
                            width: 5.w,
                          ),
                        ),
                      ),
                      overlayColor: MaterialStateProperty.all(
                        Colors.pink.withOpacity(0.4),
                      ),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
