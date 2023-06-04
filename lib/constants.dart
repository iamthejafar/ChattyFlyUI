import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppColor{
  static const Color kBlackDarkColor = Color(0xff1B202D);
  static const Color kBlackLightColor = Color(0xff292F3F);
  static const Color kGreyLightColor = Color(0xff7A8194);
  static const Color kGreyDarkColor = Color(0xff373E4E);
  static const Color kLightFontColor = Color(0xffB3B9C9);
}


class AppTextStyle{
  static TextStyle k28pxWhite600 = TextStyle(
      color: Colors.white,
      fontSize: 22.sp,
      fontWeight: FontWeight.w600
  );

  static TextStyle k20pxWhite600 = TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600
  );
  static TextStyle k13pxLightWhite500 = TextStyle(
      color: Colors.white.withOpacity(0.58),
      fontSize: 10.sp,
      fontWeight: FontWeight.w500
  );
  static TextStyle k15pxWhite600 = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 14.sp
  );

  static TextStyle k15pxWhite400 = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp
  );

  static TextStyle k14pxLightGrey400 = TextStyle(
      color: AppColor.kLightFontColor,
      fontWeight: FontWeight.w400,
      fontSize: 12.sp
  );

  static TextStyle k14pxLightGrey600 = TextStyle(
      color: AppColor.kLightFontColor,
      fontWeight: FontWeight.w600,
      fontSize: 12.sp
  );

  static TextStyle k16pxLightGrey600 = TextStyle(
      color: AppColor.kLightFontColor,
      fontWeight: FontWeight.w600,
      fontSize: 14.sp
  );
}