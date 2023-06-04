


import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';

class CustomContainerImage extends StatelessWidget {
  const CustomContainerImage({
    super.key, required this.onTap, required this.imageName,
  });

  final Function onTap;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.h)
        ),
        onTap: (){
          onTap();
        },
        child: Ink(
          height: 7.h,
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
              child: Image.asset('assets/images/$imageName')
          ),
        ),
      ),
    );
  }
}
