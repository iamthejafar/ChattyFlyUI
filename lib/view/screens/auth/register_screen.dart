import 'package:chattyfly/controller/register_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import '../../../routers/routers.dart';
import '../../widgets/custom_container_image.dart';
import '../../widgets/custom_light_black_button.dart';
import '../../widgets/white_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController controller = TextEditingController();
  GlobalKey<FormState>  registerFormKey = GlobalKey<FormState>(debugLabel: 'register');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterScreenController>(
      init: RegisterScreenController(),
      builder: (con){
        return ModalProgressHUD(
          inAsyncCall: con.isLoading,
          child: Scaffold(
            backgroundColor: AppColor.kBlackDarkColor,
            body: SafeArea(
              child: Form(
                key: registerFormKey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.w),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    children: [
                      SizedBox(height: 5.h,),
                      Hero(
                          tag: 'logo',
                          child: Image.asset('assets/images/logo.png')
                      ),
                      Text(
                          'Create an account',
                          style: AppTextStyle.k16pxLightGrey600
                      ),
                      SizedBox(height:1.h),
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
                      SizedBox(height: 1.h,),
                      WhiteTextField(
                        text: 'Confirm Password',
                        showEyeButton: true,
                        validator: (value){
                          return con.confirmPassValidator(value);
                        },
                        keyboardType: TextInputType.visiblePassword,
                        controller: con.confirmPassController,
                      ),

                      SizedBox(height: 2.h,),

                      CustomButtonLightBlack(
                        onTap: (){
                          if(registerFormKey.currentState!.validate()){
                            con.signUp();
                          }

                        },
                        text: 'Sign up',
                      ),

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(2.h),
                        child: Text('-Or sign up with-',style:AppTextStyle.k14pxLightGrey400,),
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

                      SizedBox(height: 20,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account ?',style: AppTextStyle.k14pxLightGrey400,),
                            TextButton(
                                onPressed: (){
                                  Get.toNamed(Routers.LOGINSCREEN);
                                },
                                child: Text('Login'))
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
  }
}


