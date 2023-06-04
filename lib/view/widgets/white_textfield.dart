import 'package:chattyfly/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WhiteTextField extends StatefulWidget {
   const WhiteTextField({
    super.key,
     this.text,
     this.keyboardType,
     this.controller,
     this.validator,
     this.showEyeButton = false,
     this.maxLine = 1
  });

  final String? text;
  final bool showEyeButton;
  final int maxLine;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  @override
  State<WhiteTextField> createState() => _WhiteTextFieldState();
}

class _WhiteTextFieldState extends State<WhiteTextField> {

  late bool obsecure;

  @override
  void initState() {
    obsecure = widget.showEyeButton;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.fromLTRB(5.w, 1.w, 1.w, 1.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.h),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(1.w, 1.w),
                spreadRadius: 1.h,
                blurRadius: 1.h
            ),
          ]
      ),
      child: TextFormField(
        maxLines: widget.maxLine,
        obscureText: obsecure,
        validator: widget.validator,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          suffixIcon: widget.showEyeButton?IconButton(
            color: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
             obsecure?Icons.remove_red_eye:Icons.remove_red_eye_outlined,
              color: AppColor.kBlackLightColor,
            ),
            onPressed: (){
              setState(() {
                obsecure = !obsecure;
              });
            }
          ):null,
            hintText: widget.text,
            border: InputBorder.none,
        ),
      ),
    );
  }
}
