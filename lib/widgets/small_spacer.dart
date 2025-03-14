import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallSpacer extends StatelessWidget {
  const SmallSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.sp, bottom: 16.sp),
      width: 40.sp,
      height: 4.sp,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 224, 224, 224),
        borderRadius: BorderRadius.circular(4.sp),
      ),
    );
  }
}
