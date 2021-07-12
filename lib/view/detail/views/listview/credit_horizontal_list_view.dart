import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv_app/core/constants/url/api_url.dart';
import 'package:tv_app/core/data/model/credit/credit_model.dart';
import 'package:tv_app/view/common/components/image/app_cached_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditHorizontalListView extends StatelessWidget {
  final List<CreditModel?> credits;
  final bool isCast;
  final String title;

  const CreditHorizontalListView({
    Key? key,
    required this.credits,
    this.isCast = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: Get.height * 0.3,
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
            child: ListView.builder(
              itemCount: credits.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final credit = credits[index];
                if (credit != null) {
                  return Container(
                    height: Get.height * 0.3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Material(
                                borderRadius: BorderRadius.zero,
                                elevation: 5,
                                child: Container(
                                  width: Get.width * 0.3,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: credit.profilePath != null
                                      ? AppCachedImage(
                                          imageUrl:
                                              "${ApiUrl.IMAGE_URL}${credit.profilePath}",
                                          fit: BoxFit.fill,
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 8.w),
                          child: Text(
                            credit.name ?? "",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 8.w),
                          child: Text(
                            isCast ? credit.character ?? "" : credit.job ?? "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
