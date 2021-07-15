import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tv_app/core/init/lang/lang.dart';
import 'package:get/get.dart';

class ViewAllLabel extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const ViewAllLabel({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(2),
                child: Row(
                  children: [
                    Text(
                      LocalizationKeys.HOME_VIEW_ALL.tr,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FaIcon(
                      FontAwesomeIcons.arrowAltCircleRight,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
