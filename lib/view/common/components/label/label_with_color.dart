import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelWithColor extends StatelessWidget {
  final Color color;
  final String text;

  const LabelWithColor({
    Key? key,
    required this.color,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: StadiumBorder(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
        alignment: Alignment.center,
        child: Text(
          this.text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 11.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
