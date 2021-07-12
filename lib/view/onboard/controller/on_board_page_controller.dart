import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:tv_app/core/constants/navigation/app_navigation.dart';

class OnBoardPageController extends GetxController {
  late final LiquidController liquidController;

  @override
  void onInit() {
    liquidController = LiquidController();

    super.onInit();
  }

}
