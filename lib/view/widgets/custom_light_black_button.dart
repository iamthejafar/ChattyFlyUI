

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';


class CustomButtonLightBlack extends StatelessWidget {
  const CustomButtonLightBlack({
    super.key, required this.onTap, required this.text,
  });

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.h)
      ),
      onTap: (){
        onTap();
      },
      child: Ink(
        height: 5.h,
        decoration: BoxDecoration(
            color: AppColor.kBlackLightColor,
            borderRadius: BorderRadius.circular(1.h),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(1.w, 1.w),
                  spreadRadius: 1.h,
                  blurRadius: 1.h
              )
            ]
        ),
        child: Align(
          alignment: Alignment.center,
            child: Text('$text',style: AppTextStyle.k14pxLightGrey400,)
        ),
      ),
    );
  }
}
