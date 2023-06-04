import 'package:chattyfly/constants.dart';
import 'package:chattyfly/controller/login_screen_controller.dart';
import 'package:chattyfly/view/widgets/custom_light_black_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

import '../../../routers/routers.dart';
import '../../widgets/custom_container_image.dart';
import '../../widgets/white_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: 'login');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
      init: LoginScreenController(),
      builder: (con){
        return ModalProgressHUD(
          inAsyncCall: con.isLoading,
          child: Scaffold(
            backgroundColor: AppColor.kBlackDarkColor,
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.w),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    children: [
                      SizedBox(height: 5.h,),
                      Hero(
                          tag: 'logo',
                          child: Image.asset('assets/images/logo.png',)
                      ),
                      Text(
                          'Login to your account',
                          style: AppTextStyle.k16pxLightGrey600
                      ),
                      WhiteTextField(
                        text: 'Email',
                        validator: (value){
                          return con.emailValidator(value);
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: con.emailController,
                      ),
                      SizedBox(height: 1.h,),
                      WhiteTextField(
                        text: 'Password',
                        validator: (value){
                          return con.passwordValidator(value);
                        },
                        showEyeButton: true,
                        keyboardType: TextInputType.visiblePassword,
                        controller: con.passController,
                      ),

                      SizedBox(height: 2.h,),

                      CustomButtonLightBlack(
                          onTap: (){
                            if(formKey.currentState!.validate()){
                              con.login();
                            }
                          },
                          text: 'Sign In'
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(2.h),
                        child: Text('-Or sign in with-',style:AppTextStyle.k14pxLightGrey400,),
                      ),
                      Row(
                        children: [
                          CustomContainerImage(
                            onTap: (){

                            },
                            imageName: 'google.png',
                          ),
                          SizedBox(width: 2.w,),
                          CustomContainerImage(
                            onTap: (){

                  },
                            imageName: 'fb.png',
                          ),
                          SizedBox(width: 2.w,),
                          CustomContainerImage(
                            onTap: (){

                            },
                            imageName: 'twitter.png',
                          ),

                        ],
                      ),

                      SizedBox(height: 1.h,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account ?',style: AppTextStyle.k14pxLightGrey400,),
                            TextButton(
                                onPressed: (){
                                  Get.toNamed(Routers.REGISTERSCREEN);
                                },
                                child: Text('Sign Up'))
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        );

      },
    );
    // return GetBuilder<LoginScreenController>(
    //   init: LoginScreenController(),
    //   builder: (con){
    //
    //   },
    // );
  }
}
