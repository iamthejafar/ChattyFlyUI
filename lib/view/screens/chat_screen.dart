import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBlackDarkColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Messages', style: AppTextStyle.k28pxWhite600,),
                      InkWell(
                        child: Image.asset('assets/images/search.png',scale: 1.5,),
                      )
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Text('R E C E N T',style: AppTextStyle.k13pxLightWhite500,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
