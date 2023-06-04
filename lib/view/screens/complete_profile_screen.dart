
import 'package:chattyfly/constants.dart';
import 'package:chattyfly/controller/complete_profile_screen_controller.dart';
import 'package:chattyfly/view/widgets/custom_light_black_button.dart';
import 'package:chattyfly/view/widgets/white_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: 'login');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteProfileScreenController>(
      init: CompleteProfileScreenController(),
      builder: (con){
        return ModalProgressHUD(
          inAsyncCall: con.isLoading,
          child: Scaffold(
            backgroundColor: AppColor.kBlackDarkColor,
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.h),
                        // color: AppColor.kBlackLightColor
                      ),
                        padding: EdgeInsets.all(3.h),
                        child: Text('Complete Profile',style: AppTextStyle.k20pxWhite600,)
                    ),
                    SizedBox(height: 5.h,),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.w),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Center(
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: con.imageFile!=null? Image.file(con.imageFile!,fit: BoxFit.cover,).image:null,
                                    backgroundColor: AppColor.kBlackLightColor,
                                    radius: 9.h,
                                    child: con.imageFile==null? Icon(Icons.person,size: 10.h,color: AppColor.kGreyLightColor,):SizedBox(),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      con.showphotooption(context);
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: AppColor.kGreyDarkColor,
                                        child: Icon(Icons.camera_alt,color: AppColor.kGreyLightColor,)
                                    ),
                                  )
                                ],
                              ),
                            ),

                            SizedBox(height: 2.h,),

                            WhiteTextField(
                              controller: con.firstNameController,
                              text: 'First Name', showEyeButton: false,
                              keyboardType: TextInputType.text,
                              validator: (value){
                                return con.firstNameValidator(value);

                              },
                            ),
                            WhiteTextField(
                              controller: con.lastNameController,
                              text: 'Last Name', showEyeButton: false,
                              keyboardType: TextInputType.text,
                              validator: (value){
                                return con.lastNameValidator(value);

                              },
                            ),

                            WhiteTextField(
                              controller: con.statusController,
                              maxLine: 2,
                              text: 'Add Status', showEyeButton: false,
                              keyboardType: TextInputType.text,
                              validator: (value){
                                return con.statusValidator(value);

                              },
                            ),
                            SizedBox(height: 2.h,),
                            CustomButtonLightBlack(
                                onTap: (){

                                  if(formKey.currentState!.validate()){
                                    if(con.imageFile == null){
                                      Get.snackbar(
                                          'Error', 'Add Profile Photo',
                                          backgroundColor: Colors.white,
                                          borderRadius: 2.h,
                                          icon: Icon(Icons.error_outline, color: Colors.red,size: 3.h,)

                                      );
                                    }else{
                                      con.addUserToFirebase();
                                    }

                                  }

                                },
                                text: 'Submit'
                            )
                          ],
                        ),
                      )
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
