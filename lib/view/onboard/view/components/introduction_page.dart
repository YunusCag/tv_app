import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv_app/core/init/lang/lang.dart';

class IntroductionPage extends StatelessWidget {
  final Color color;
  final String title;
  final String description;
  final String assetImage;
  final bool isLast;
  void Function()? onPress;

  IntroductionPage(
      {Key? key,
      required this.color,
      required this.title,
      required this.description,
      required this.assetImage,
      this.isLast = false,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      decoration: BoxDecoration(
        color: this.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8)
            ),
            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
            child: Image.asset(
              assetImage,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          isLast
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: this.onPress,
                    child: Text(
                      LocalizationKeys.ON_BOARD_PAGE_SKIP_BUTTON_TEXT.tr,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
