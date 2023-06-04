import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chattyfly/constants.dart';
import 'package:chattyfly/controller/auth_controller.dart';
import 'package:chattyfly/view/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routers/routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;
  void initState(){
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 3),);
    animation = ColorTween(begin: Colors.blue.shade900, end: AppColor.kBlackLightColor).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
      });
    });
  }
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        (() => Get.put(AuthController())
        ));
    return Scaffold(
      backgroundColor: animation.value,
      body: Center(
        child: Hero(
            tag: 'logo',
            child: Image.asset('assets/images/logo.png')
        ),
        // child:  AnimatedTextKit(animatedTexts: [
        //   WavyAnimatedText('Chatty Fly', textStyle: AppTextStyle.k28pxWhite600)
        // ]
        // ),
      ),
    );
  }
}
