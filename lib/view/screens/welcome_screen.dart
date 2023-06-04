import 'package:chattyfly/constants.dart';
import 'package:chattyfly/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;
  @override
  void initState(){
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2),);
    animation = ColorTween(begin: Colors.purple, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
      });
    });
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBlackDarkColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 70.0,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                ),
                AnimatedTextKit(animatedTexts: [
                  WavyAnimatedText('Chatty Fly', textStyle: AppTextStyle.k28pxWhite600)
                ]
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),

            InkWell(
              onTap: (){
                Get.toNamed(Routers.LOGINSCREEN);

              },
              child: Container(
                height: 6.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.kBlackLightColor,
                  borderRadius: BorderRadius.circular(5.h),
                ),
                child: Text('Login',style: AppTextStyle.k15pxWhite600,),
              ),
            ),
            SizedBox(height: 1.h,),
            InkWell(
              onTap: (){

              },
              child: Container(
                height: 6.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.kBlackLightColor,
                  borderRadius: BorderRadius.circular(5.h),
                ),
                child: Text('Signup',style: AppTextStyle.k15pxWhite600,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



