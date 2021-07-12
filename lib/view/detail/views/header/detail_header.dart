import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tv_app/core/init/lang/lang.dart';

class DetailHeader extends StatelessWidget {
  final String name;
  final String overView;
  final String firstAirDate;
  final String lastAirDate;
  DetailHeader({
    Key? key,
    required this.name,
    required this.overView,
    required this.firstAirDate,
    required this.lastAirDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.2
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          RichText(
            text: TextSpan(
              text: LocalizationKeys.DETAIL_PAGE_FIRST_ON_AIR.tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
              children: [
                TextSpan(
                  text: "${firstAirDate}\n",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                  )
                ),
                TextSpan(
                    text: LocalizationKeys.DETAIL_PAGE_LAST_ON_AIR.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  children: [
                    TextSpan(
                        text: "${lastAirDate}",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                        )
                    ),
                  ]
                ),
              ]
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            overView,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
